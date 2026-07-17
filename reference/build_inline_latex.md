# Build LaTeX code for inline table

Build LaTeX code for inline table

## Usage

``` r
build_inline_latex(
  path,
  width,
  height,
  align,
  caption,
  caption_short,
  label,
  caption_position,
  frame = FALSE,
  frame_color = "black",
  frame_width = "0.4pt",
  background = NULL,
  inner_sep = "2pt"
)
```

## Arguments

- path:

  Path to the PDF file.

- width:

  Width specification.

- height:

  Height specification.

- align:

  Alignment (left, center, right).

- caption:

  Caption text.

- caption_short:

  Short caption for LoT.

- label:

  LaTeX label.

- caption_position:

  Above or below.

- frame:

  Whether to draw a frame border.

- frame_color:

  Color for frame border.

- frame_width:

  Line width for frame.

- background:

  Background color.

- inner_sep:

  Padding inside the box.

## Value

Character string with LaTeX code.
