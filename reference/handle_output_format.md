# Generate output in specified format

Internal function to handle output format conversion after PDF
generation.

## Usage

``` r
handle_output_format(
  pdf_path,
  output_format = "pdf",
  dpi = 300,
  tex_path = NULL
)
```

## Arguments

- pdf_path:

  Path to the generated PDF file.

- output_format:

  Target format: "pdf", "png", "svg", or "tex".

- dpi:

  Resolution for PNG output.

- tex_path:

  Path to the TEX file (for "tex" format).

## Value

Path to the final output file.
