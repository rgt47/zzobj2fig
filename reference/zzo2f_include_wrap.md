# Include a rendered table with text flowing around it (approximation)

Typst has no direct `wrapfigure`; this emits a
`#place(auto, float: true, ...)` block that floats the figure to the
requested side. Text does not literally wrap around the figure in the
LaTeX sense.

## Usage

``` r
zzo2f_include_wrap(
  path,
  placement = c("r", "l", "right", "left"),
  wrap_width = "0.5\\textwidth",
  width = NULL,
  caption = NULL,
  label = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the image file.

- placement:

  `"r"`, `"l"`, or their long forms `"right"`, `"left"`.

- wrap_width:

  Character. Typst or LaTeX width; translated.

- width:

  Character or NULL. Defaults to `wrap_width`.

- caption:

  Character or NULL.

- label:

  Character or NULL.

- cat:

  Logical.

## Value

Character; printed when `cat = TRUE`.
