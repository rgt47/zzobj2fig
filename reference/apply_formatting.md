# Apply formatting specifications to a kableExtra table

Internal function that applies a list of o2f_format objects to a
kableExtra LaTeX table.

## Usage

``` r
apply_formatting(kable_obj, df, formatting)
```

## Arguments

- kable_obj:

  A kableExtra table object.

- df:

  The original data frame (for resolving column names).

- formatting:

  A list of o2f_format objects.

## Value

The modified kableExtra table object.
