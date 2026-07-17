# Create side-by-side comparison table for rms models

Generate a publication-ready table comparing multiple rms regression
models side-by-side, similar to o2f_regression() but optimized for rms
objects.

## Usage

``` r
o2f_rms_compare(
  ...,
  digits = 3,
  exponentiate = FALSE,
  stars = c(0.05, 0.01, 0.001),
  filename = "rms_comparison",
  sub_dir = get_default_figures_dir(),
  o2f_args = list()
)
```

## Arguments

- ...:

  Named rms model objects to compare (ols, lrm, cph, etc.).

- digits:

  Number of decimal places.

- exponentiate:

  Logical. Exponentiate coefficients where appropriate.

- stars:

  Logical or numeric vector for significance stars.

- filename:

  Base name for output files.

- sub_dir:

  Output directory.

- o2f_args:

  List of additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
library(rms)
dd <- datadist(mtcars)
options(datadist = "dd")
m1 <- ols(mpg ~ wt, data = mtcars)
m2 <- ols(mpg ~ wt + cyl, data = mtcars)
m3 <- ols(mpg ~ wt + cyl + hp, data = mtcars)
o2f_rms_compare(Model1 = m1, Model2 = m2, Model3 = m3)
} # }
```
