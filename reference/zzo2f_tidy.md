# Tidy a model object and render with the Typst backend

Tidy a model object and render with the Typst backend

## Usage

``` r
zzo2f_tidy(x, tidy_args = list(), glance = FALSE, digits = 3L, ...)
```

## Arguments

- x:

  A model object accepted by
  [`broom::tidy()`](https://generics.r-lib.org/reference/tidy.html).

- tidy_args:

  List of additional arguments to
  [`broom::tidy()`](https://generics.r-lib.org/reference/tidy.html).

- glance:

  Logical. If TRUE and a `glance()` method exists, a model-summary line
  is emitted via [`message()`](https://rdrr.io/r/base/message.html).

- digits:

  Integer. Decimal places.

- ...:

  Forwarded to
  [`zzo2f.default()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.default.md).

## Value

Output-file path from
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Examples

``` r
if (FALSE) { # \dontrun{
m <- lm(mpg ~ cyl, data = mtcars)
zzo2f_tidy(m, filename = "lm_tidy")
} # }
```
