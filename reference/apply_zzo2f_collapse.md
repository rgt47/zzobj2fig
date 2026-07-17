# Apply a collapse spec to a data frame

Returns a list with the modified data frame and a vector of row indices
where group boundaries occur (1-based, data rows). Empty-ing repeated
cells must happen before the tinytable is constructed so that the Typst
output reflects the merged presentation.

## Usage

``` r
apply_zzo2f_collapse(data, spec)
```

## Arguments

- data:

  Data frame.

- spec:

  A `zzo2f_collapse` object or NULL.

## Value

A list with elements `data` and `boundaries`.
