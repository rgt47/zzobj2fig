# Coefficient table rendered inline with the Typst backend

Convenience wrapper that renders a fitted model as a coefficient table
via
[`zzo2f_inline()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_inline.md).
Matches the shape of
[`o2f_coef()`](https://rgt47.github.io/zzobj2fig/reference/o2f_coef.md),
minus LaTeX-specific arguments (`frame`, `background`, `inner_sep`,
etc.) that have no Typst analog.

## Usage

``` r
zzo2f_coef(
  model,
  width = "3in",
  align = "center",
  digits = 3L,
  theme = "minimal",
  caption = NULL,
  label = NULL,
  ...
)
```

## Arguments

- model:

  A fitted model (`lm`, `glm`, or any object with a `zzo2f` S3 method).

- align:

  One of `"center"`, `"left"`, `"right"`.

- digits:

  Decimal places.

- theme:

  Theme name or object.

- caption:

  Character or NULL.

- label:

  Character or NULL.

- ...:

  Forwarded to
  [`zzo2f_inline()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_inline.md)
  / [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Value

Path to the rendered file.
