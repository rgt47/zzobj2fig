# Translate o2f_header to tinytable group_tt spec

Converts a o2f_header object (or list of them) into a named list
suitable for `tinytable::group_tt(j=)`.

## Usage

``` r
translate_header_above(header_above)
```

## Arguments

- header_above:

  A o2f_header object, list of o2f_header objects, or NULL.

## Value

A named list mapping group labels to column index ranges, or NULL.
