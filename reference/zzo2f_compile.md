# Compile Typst source to an image file

Escape hatch for users who want to post-process the Typst source between
construction and compilation. Use in conjunction with
`zzo2f(..., compile = FALSE)`.

## Usage

``` r
zzo2f_compile(
  source,
  filename = NULL,
  sub_dir = NULL,
  format = c("pdf", "png", "svg"),
  dpi = 300L,
  verbose = FALSE
)
```

## Arguments

- source:

  A `zzo2f_source` object (returned by `zzo2f(..., compile = FALSE)`) or
  a character vector of Typst source lines.

- filename:

  Character. Base filename (no extension). If `source` carries a
  `filename` attribute, it is used when `filename` is NULL.

- sub_dir:

  Character. Output directory. Defaults to the attribute on `source` or
  `"figures"`.

- format:

  Character. "pdf", "png", or "svg".

- dpi:

  Integer. PNG resolution.

- verbose:

  Logical.

## Value

Invisibly, the path to the compiled output file.

## Examples

``` r
if (FALSE) { # \dontrun{
src <- zzo2f(mtcars[1:5, 1:3], filename = "demo", compile = FALSE)
src <- c("// user comment", src)
zzo2f_compile(src, filename = "demo")
} # }
```
