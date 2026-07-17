# Get required LaTeX packages for margin methods

Returns the LaTeX package requirements for each margin placement method.

## Usage

``` r
o2f_margin_packages(
  method = c("sidenotes", "marginpar", "tufte", "marginnote")
)
```

## Arguments

- method:

  The margin method: "sidenotes", "marginpar", "tufte", or "marginnote".

## Value

Character string with the required \usepackage command(s), or NULL if no
packages needed.

## Examples

``` r
o2f_margin_packages("sidenotes")
#> [1] "\\usepackage{sidenotes}"
```
