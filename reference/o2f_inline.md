# Inline Table for R Markdown Documents

Generate a table and include it inline in an R Markdown document.
Automatically handles PDF vs HTML output and provides control over size,
alignment, captioning, and visual styling without using floats.

## Usage

``` r
o2f_inline(
  x,
  width = NULL,
  height = NULL,
  align = c("center", "left", "right"),
  filename = NULL,
  format = c("auto", "pdf", "png"),
  dpi = 150,
  sub_dir = NULL,
  caption = NULL,
  caption_short = NULL,
  label = NULL,
  caption_position = c("above", "below"),
  frame = FALSE,
  frame_color = "black",
  frame_width = "0.4pt",
  background = NULL,
  inner_sep = "2pt",
  ...
)
```

## Arguments

- x:

  An object to convert to a table (data.frame, lm, glm, etc.).

- width:

  Figure width. Use LaTeX units for PDF ("2in", "5cm", "0.5\textwidth")
  or CSS/pixels for HTML.

- height:

  Optional figure height. If NULL, aspect ratio is preserved.

- align:

  Alignment: "left", "center", or "right".

- filename:

  Optional filename. If NULL, a temp file is used.

- format:

  Output format: "auto" (detect from knitr), "pdf", or "png".

- dpi:

  Resolution for PNG output. Default 150.

- sub_dir:

  Directory for output files. If NULL (default), uses tempdir().

- caption:

  Table caption. Uses \captionof for non-float placement. Defaults to
  NULL (no caption).

- caption_short:

  Short caption for List of Tables. Defaults to NULL.

- label:

  LaTeX label for cross-referencing (e.g., "tab:model"). Defaults to
  NULL (no label).

- caption_position:

  Position of caption: "above" (default, standard for tables) or
  "below".

- frame:

  Logical. If TRUE, draw a border around the table. Default FALSE.

- frame_color:

  Color for the frame border. Uses xcolor syntax (e.g., "black",
  "blue!50"). Default "black".

- frame_width:

  Line width for the frame. Default "0.4pt".

- background:

  Background color for the table container. Uses xcolor syntax (e.g.,
  "gray!10", "yellow!5"). Default NULL (no background).

- inner_sep:

  Padding between content and frame. Default "2pt".

- ...:

  Additional arguments passed to o2f().

## Value

For knitr, returns the result of knitr::asis_output() with LaTeX code.
When called outside knitr, returns the file path invisibly.

## Details

This function streamlines the workflow for including tables in R
Markdown:

1.  Generates the table PDF via o2f() (without embedded caption)

2.  For HTML output, converts to PNG

3.  Wraps in LaTeX with alignment and caption using \captionof

The table is placed exactly where the code chunk appears (no float).
Captions use `\\captionof\{table\}\{...\}` which requires the LaTeX
`caption` package. Add to your R Markdown YAML header:

    header-includes:
      - \\usepackage{caption}

## Examples

``` r
if (FALSE) { # \dontrun{
# In R Markdown chunk:
model <- lm(mpg ~ cyl + hp, data = mtcars)
o2f_inline(model, width = "2in", align = "left")

# With caption and label for cross-referencing:
o2f_inline(model,
           width = "3in",
           caption = "Linear model coefficients",
           label = "tab:model")

# Caption below the table:
o2f_inline(model,
           width = "3in",
           caption = "Results",
           caption_position = "below")

# With frame border:
o2f_inline(model,
           width = "3in",
           frame = TRUE,
           frame_color = "gray",
           frame_width = "0.5pt")

# With background color:
o2f_inline(model,
           width = "3in",
           background = "gray!5")

# With both frame and background:
o2f_inline(model,
           width = "3in",
           frame = TRUE,
           frame_color = "blue!50",
           background = "blue!5",
           inner_sep = "4pt")

# With explicit format:
o2f_inline(mtcars[1:5,], width = "4in", format = "png", dpi = 300)
} # }
```
