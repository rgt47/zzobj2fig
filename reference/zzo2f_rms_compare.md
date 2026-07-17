# Side-by-side RMS regression comparison (Typst backend)

Side-by-side RMS regression comparison (Typst backend)

## Usage

``` r
zzo2f_rms_compare(
  ...,
  digits = 3L,
  exponentiate = FALSE,
  stars = c(0.05, 0.01, 0.001),
  filename = "rms_comparison",
  sub_dir = get_default_figures_dir(),
  zzo2f_args = list()
)
```

## Arguments

- ...:

  Named `rms` model objects.

- digits:

  Decimal places.

- exponentiate:

  Logical.

- stars:

  Numeric vector of significance thresholds.

- filename:

  Output base filename.

- sub_dir:

  Output directory.

- zzo2f_args:

  List of arguments forwarded to
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md).

## Value

Path to the rendered file.
