# Build a coefficient table from tidy output

Constructs a standardized coefficient table from broom::tidy() output.
Used by multiple S3 methods for statistical objects.

## Usage

``` r
build_coef_table(
  tidy_df,
  digits,
  est_label = "Estimate",
  conf.int = TRUE,
  include_pvalue = TRUE
)
```

## Arguments

- tidy_df:

  Data frame from broom::tidy().

- digits:

  Number of decimal places for rounding.

- est_label:

  Label for estimate column (e.g., "Estimate", "HR", "OR").

- conf.int:

  Logical. Include confidence intervals if available.

- include_pvalue:

  Logical. Include p-value column if available.

## Value

Data frame with formatted coefficients.
