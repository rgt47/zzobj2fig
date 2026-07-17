# Convert PDF to SVG

Convert a PDF file to SVG format using pdf2svg or Inkscape.

## Usage

``` r
convert_pdf_to_svg(pdf_path, svg_path = NULL)
```

## Arguments

- pdf_path:

  Path to the input PDF file.

- svg_path:

  Path for the output SVG file. If NULL, uses the same path with .svg
  extension.

## Value

Invisibly returns the path to the SVG file.
