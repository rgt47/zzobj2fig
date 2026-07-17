# Insert separator horizontal line in table

Insert separator horizontal line in table

## Usage

``` r
pp_separator_hline(lines, separator_row, n_cols)
```

## Arguments

- lines:

  Character vector.

- separator_row:

  Integer. 1-based data row where separator goes. The hline appears
  above this row (between row separator_row-1 and separator_row). The y
  coordinate in Typst is separator_row + 1 (accounting for the header
  row).

- n_cols:

  Integer. Number of table columns.

## Value

Modified character vector.
