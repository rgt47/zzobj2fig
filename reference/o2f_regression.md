# Create side-by-side regression comparison table

Generate a publication-ready table comparing multiple regression models
side-by-side.

## Usage

``` r
o2f_regression(
  ...,
  include = c("estimate", "std.error"),
  stars = c(0.05, 0.01, 0.001),
  digits = 3,
  se_in_parens = TRUE,
  filename = "regression_table",
  sub_dir = get_default_figures_dir(),
  o2f_args = list()
)
```

## Arguments

- ...:

  Named lm or glm objects to compare.

- include:

  Character vector of statistics to include per model.

- stars:

  Logical or numeric vector. If TRUE, use default significance
  thresholds. If numeric, specifies p-value cutoffs for stars.

- digits:

  Number of decimal places.

- se_in_parens:

  Logical. Show standard errors in parentheses below estimates.

- filename:

  Base name for output files.

- sub_dir:

  Output directory for generated files.

- o2f_args:

  List of additional arguments passed to o2f().

## Value

Invisibly returns the path to the generated PDF.

## Examples

``` r
if (FALSE) { # \dontrun{
m1 <- lm(mpg ~ cyl, data = mtcars)
m2 <- lm(mpg ~ cyl + hp, data = mtcars)
m3 <- lm(mpg ~ cyl + hp + wt, data = mtcars)
o2f_regression(Model1 = m1, Model2 = m2, Model3 = m3)
} # }
```
