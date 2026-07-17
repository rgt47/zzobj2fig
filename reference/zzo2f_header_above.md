# Spanning column headers (Typst backend)

Thin constructor that delegates to
[`o2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/o2f_header_above.md).
The underlying `o2f_header` spec is backend-agnostic;
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
already consumes it via
[`tinytable::group_tt()`](https://vincentarelbundock.github.io/tinytable/man/group_tt.html).
This constructor exists so the Typst pipeline has a naming-consistent
entry point.

## Usage

``` r
zzo2f_header_above(
  ...,
  bold = TRUE,
  italic = FALSE,
  align = "c",
  line = TRUE,
  line_sep = 3
)
```

## Arguments

- ...:

  Named numeric spans, e.g., `"Group" = 2`.

- bold:

  Logical.

- italic:

  Logical.

- align:

  Character.

- line:

  Logical. Retained for API symmetry with `o2f_header_above`; Typst
  draws spanning-header rules automatically via `group_tt()`.

- line_sep:

  Numeric. Retained for API symmetry; no effect on Typst output.

## Value

A `o2f_header` object.

## Examples

``` r
if (FALSE) { # \dontrun{
hdr <- zzo2f_header_above(" " = 1, "Treatment" = 2, "Control" = 2)
zzo2f(df, header_above = hdr)
} # }
```
