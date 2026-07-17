# Convert any broom-supported object to a LaTeX table

A general-purpose function that uses broom::tidy() to convert any
broom-supported object to a tidy data frame, then generates a LaTeX

table via o2f().

## Usage

``` r
o2f_tidy(x, tidy_args = list(), glance = FALSE, digits = 3, ...)
```

## Arguments

- x:

  An object supported by broom::tidy().

- tidy_args:

  A list of arguments to pass to broom::tidy().

- glance:

  Logical. If TRUE, append model-level statistics from broom::glance()
  as footnote or additional rows.

- digits:

  Number of decimal places for rounding.

- ...:

  Additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
library(survival)
cox_model <- coxph(Surv(time, status) ~ age + sex, data = lung)
o2f_tidy(cox_model, filename = "cox_results")
} # }
```
