# Quick coefficient table from model

Convenience function to generate an inline coefficient table from a
regression model with sensible defaults.

## Usage

``` r
o2f_coef(
  model,
  width = "3in",
  align = "left",
  digits = 3,
  theme = "minimal",
  caption = NULL,
  caption_short = NULL,
  label = NULL,
  caption_position = "above",
  frame = FALSE,
  frame_color = "black",
  frame_width = "0.4pt",
  background = NULL,
  inner_sep = "2pt",
  ...
)
```

## Arguments

- model:

  A fitted model object (lm, glm, coxph, etc.).

- width:

  Figure width. Default "3in".

- align:

  Alignment. Default "left".

- digits:

  Number of decimal places.

- theme:

  Table theme. Default "minimal".

- caption:

  Optional table caption.

- caption_short:

  Short caption for List of Tables. Defaults to NULL.

- label:

  LaTeX label for cross-referencing. Defaults to NULL.

- caption_position:

  Position of caption: "above" (default) or "below".

- frame:

  Logical. If TRUE, draw a border around the table. Default FALSE.

- frame_color:

  Color for the frame border. Default "black".

- frame_width:

  Line width for the frame. Default "0.4pt".

- background:

  Background color for the table container. Default NULL.

- inner_sep:

  Padding between content and frame. Default "2pt".

- ...:

  Additional arguments passed to o2f_inline().

## Value

Same as o2f_inline().

## Examples

``` r
if (FALSE) { # \dontrun{
model <- lm(mpg ~ cyl + hp + wt, data = mtcars)
o2f_coef(model)

# With frame and background
o2f_coef(model, frame = TRUE, background = "gray!5")
} # }
```
