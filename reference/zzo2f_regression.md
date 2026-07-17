# Side-by-side regression comparison table (Typst backend)

Side-by-side regression comparison table (Typst backend)

## Usage

``` r
zzo2f_regression(
  ...,
  include = c("estimate", "std.error"),
  stars = c(0.05, 0.01, 0.001),
  digits = 3,
  se_in_parens = TRUE,
  filename = "regression_table",
  sub_dir = get_default_figures_dir(),
  format = c("pdf", "png", "svg"),
  theme = NULL,
  caption = NULL,
  zzo2f_args = list()
)
```

## Arguments

- ...:

  Named lm or glm objects to compare.

- include:

  Character vector of statistics to include.

- stars:

  Logical or numeric vector for significance thresholds.

- digits:

  Number of decimal places.

- se_in_parens:

  Show standard errors in parentheses.

- filename:

  Base name for output files.

- sub_dir:

  Output directory.

- zzo2f_args:

  List of additional arguments passed to zzo2f().

## Value

Invisibly returns the path to the output file.

## Examples

``` r
if (FALSE) { # \dontrun{
m1 <- lm(mpg ~ cyl, data = mtcars)
m2 <- lm(mpg ~ cyl + hp, data = mtcars)
m3 <- lm(mpg ~ cyl + hp + wt, data = mtcars)
zzo2f_regression(Model1 = m1, Model2 = m2, Model3 = m3)
} # }
```
