# Ensure pdfcrop is available

Checks for pdfcrop and attempts to install it via tinytex if available.
Provides helpful instructions if installation is not possible.

## Usage

``` r
ensure_pdfcrop(auto_install = TRUE, verbose = TRUE)
```

## Arguments

- auto_install:

  Logical. If TRUE, attempt automatic installation via tinytex. Default
  is TRUE.

- verbose:

  Logical. Print status messages. Default is TRUE.

## Value

Logical indicating if pdfcrop is available (invisibly).

## Examples

``` r
if (FALSE) { # \dontrun{
ensure_pdfcrop()
} # }
```
