# Include a rendered table inline (no figure wrapper)

Include a rendered table inline (no figure wrapper)

## Usage

``` r
zzo2f_include_inline(
  path,
  width = "\\textwidth",
  center = TRUE,
  vspace = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the image file.

- width:

  Width spec.

- center:

  Logical.

- vspace:

  Character or NULL. Typst length, e.g. `"1em"`; inserted as
  `#v(length)` before and after.

- cat:

  Logical.

## Value

Character; printed when `cat = TRUE`.

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_include_inline("figures/mytab", width = "0.9\\textwidth",
                      cat = FALSE)
} # }
```
