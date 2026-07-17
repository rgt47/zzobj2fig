# NEJM theme

Theme following New England Journal of Medicine table styling.
Characterized by light cream alternating row striping (#FEF8EA),
sans-serif font (Helvetica), booktabs horizontal rules, and compact
spacing.

## Usage

``` r
o2f_theme_nejm()
```

## Value

A o2f_theme object.

## Details

NEJM tables are designed for maximum clarity and professional appearance
in medical publications. Key characteristics:

- Light cream alternating row colors (#FEF8EA)

- Sans-serif font (Helvetica/Arial family)

- Booktabs-style horizontal rules (\toprule, \midrule, \bottomrule)

- Compact column spacing (4pt)

- Slightly increased row spacing (1.15 stretch) for readability

- Footnotesize font for space efficiency

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_theme_set(o2f_theme_nejm())
o2f(mtcars[1:10, 1:5], filename = "nejm_table")
} # }
```
