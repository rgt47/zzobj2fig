# Convert PDF to PNG

Convert a PDF file to PNG format using ImageMagick.

## Usage

``` r
convert_pdf_to_png(pdf_path, png_path = NULL, dpi = 300, background = "white")
```

## Arguments

- pdf_path:

  Path to the input PDF file.

- png_path:

  Path for the output PNG file. If NULL, uses the same path with .png
  extension.

- dpi:

  Resolution in dots per inch. Defaults to 300.

- background:

  Background color. Defaults to "white".

## Value

Invisibly returns the path to the PNG file.
