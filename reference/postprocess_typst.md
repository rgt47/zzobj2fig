# Post-process Typst source lines

Post-process Typst source lines

## Usage

``` r
postprocess_typst(lines, opts = list())
```

## Arguments

- lines:

  Character vector of .typ file lines.

- opts:

  Named list of options:

  font_family

  :   Character or NULL. Typst font name.

  caption_above

  :   Logical. Place caption above table.

  separator_row

  :   Integer or NULL. 1-based data row index where a horizontal line
      should be inserted (e.g., to separate coefficients from summary
      statistics).

  n_cols

  :   Integer or NULL. Number of table columns (needed for separator
      hline).

  compact_footnotes

  :   Logical. Style footnotes smaller.

## Value

Modified character vector.
