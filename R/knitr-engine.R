#' knitr Engine Integration
#'
#' @description Custom knitr engine for embedding o2f tables directly in
#'   R Markdown documents.
#'
#' @name knitr-engine
NULL

#' o2f knitr engine
#'
#' @description Process a o2f code chunk in R Markdown. The chunk should
#'   contain R code that evaluates to a data frame.
#'
#' @param options Chunk options passed by knitr.
#'
#' @return Engine output for knitr.
#'
#' @details
#' Supported chunk options (prefix with `o2f.`):
#'
#' - `o2f.scolor`: Row shading color
#' - `o2f.caption`: Table caption
#' - `o2f.label`: LaTeX label
#' - `o2f.theme`: Theme name
#' - `o2f.align`: Column alignment
#' - `o2f.crop_margin`: Crop margin
#' - `o2f.output_format`: Output format (pdf, png, svg)
#'
#' @examples
#' \dontrun{
#' # In R Markdown:
#' # ```{o2f, o2f.caption="My Table", o2f.theme="nejm"}
#' # mtcars[1:5, 1:4]
#' # ```
#' }
#'
#' @keywords internal
o2f_engine <- function(options) {
  if (!requireNamespace("knitr", quietly = TRUE)) {
    stop("knitr is required for the o2f engine.", call. = FALSE)
  }

  # Get the code from the chunk
 code <- paste(options$code, collapse = "\n")

  # Evaluate the code to get the data frame
  env <- knitr::knit_global()
  result <- tryCatch(
    eval(parse(text = code), envir = env),
    error = function(e) {
      return(list(error = e$message))
    }
  )

  # Handle evaluation errors
  if (is.list(result) && !is.null(result$error)) {
    return(knitr::engine_output(
      options,
      code,
      paste("Error evaluating chunk:", result$error)
    ))
  }

  # Ensure result is a data frame
  if (!is.data.frame(result)) {
    if (is.matrix(result)) {
      result <- as.data.frame(result)
    } else {
      return(knitr::engine_output(
        options,
        code,
        "Chunk must return a data frame or matrix."
      ))
    }
  }

  # Extract o2f-specific options
  o2f_opts <- list()

  if (!is.null(options$o2f.scolor)) o2f_opts$scolor <- options$o2f.scolor
  if (!is.null(options$o2f.caption)) o2f_opts$caption <- options$o2f.caption
  if (!is.null(options$o2f.label)) o2f_opts$label <- options$o2f.label
  if (!is.null(options$o2f.theme)) o2f_opts$theme <- options$o2f.theme
  if (!is.null(options$o2f.align)) o2f_opts$align <- options$o2f.align
  if (!is.null(options$o2f.crop_margin)) {
    o2f_opts$crop_margin <- options$o2f.crop_margin
  }
  if (!is.null(options$o2f.longtable)) o2f_opts$longtable <- options$o2f.longtable

  # Determine output format
  output_format <- options$o2f.output_format %||% "pdf"

  # Generate unique filename based on chunk label
  filename <- options$label %||% paste0("o2f_", format(Sys.time(), "%H%M%S"))
  filename <- gsub("[^a-zA-Z0-9_]", "_", filename)

  # Determine output directory
  fig_path <- knitr::opts_chunk$get("fig.path") %||% "figure/"
  sub_dir <- dirname(file.path(fig_path, filename))

  # Build o2f arguments
  o2f_args <- c(
    list(
      x = result,
      filename = filename,
      sub_dir = sub_dir,
      verbose = FALSE
    ),
    o2f_opts
  )

  # Generate the table
  output_path <- tryCatch(
    do.call(o2f, o2f_args),
    error = function(e) {
      return(list(error = e$message))
    }
  )

  # Handle o2f errors
  if (is.list(output_path) && !is.null(output_path$error)) {
    return(knitr::engine_output(
      options,
      code,
      paste("Error generating table:", output_path$error)
    ))
  }

  # Handle output format conversion if needed
  if (output_format != "pdf") {
    output_path <- tryCatch(
      handle_output_format(output_path, output_format),
      error = function(e) output_path
    )
  }

  # Generate markdown image reference
  if (file.exists(output_path)) {
    # Use relative path for output
    rel_path <- output_path

    # Generate appropriate output based on format
    if (output_format == "tex") {
      tex_content <- readLines(sub("\\.pdf$", ".tex", output_path))
      out <- paste(c("```latex", tex_content, "```"), collapse = "\n")
    } else {
      out <- sprintf("![%s](%s)", options$o2f.caption %||% "", rel_path)
    }

    knitr::engine_output(options, code, out)
  } else {
    knitr::engine_output(
      options,
      code,
      paste("Output file not found:", output_path)
    )
  }
}

#' Register the o2f knitr engine
#'
#' @description Register the o2f engine with knitr. This is called
#'   automatically when the package is loaded.
#'
#' @return Invisible NULL.
#'
#' @export
register_o2f_engine <- function() {
  if (requireNamespace("knitr", quietly = TRUE)) {
    knitr::knit_engines$set(o2f = o2f_engine)
  }
  invisible(NULL)
}
