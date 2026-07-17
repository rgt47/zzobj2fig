# Collapse repeated values in columns (Typst backend)

Create a specification that visually merges consecutive cells with
identical values in the specified columns. Achieved by replacing
repeated values with empty strings before the tinytable is built;
optionally inserts horizontal rules between groups.

## Usage

``` r
zzo2f_collapse_rows(columns = NULL, hline = c("major", "full", "none"))
```

## Arguments

- columns:

  Integer or character vector. Columns in which to collapse consecutive
  repeated values. NULL applies to all columns, matching
  [`o2f_collapse_rows()`](https://rgt47.github.io/zzobj2fig/reference/o2f_collapse_rows.md)
  behavior.

- hline:

  Character. One of `"major"` (rule only between group boundaries in the
  first specified column), `"full"` (rule between every group boundary
  in any specified column), or `"none"`.

## Value

A `zzo2f_collapse` object.

## Examples

``` r
if (FALSE) { # \dontrun{
df <- data.frame(
  Group = rep(c("A", "B"), each = 3),
  Subgroup = rep(c("x", "y", "z"), 2),
  Value = 1:6
)
zzo2f(df, collapse_rows = zzo2f_collapse_rows("Group"))
} # }
```
