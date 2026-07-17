# Internal Typst pipeline

Internal Typst pipeline

## Usage

``` r
zzo2f_internal(
  x,
  filename,
  sub_dir,
  verbose,
  caption,
  align,
  theme,
  scolor,
  footnote,
  header_above,
  format,
  dpi,
  separator_row = NULL,
  formats = NULL,
  collapse_rows = NULL,
  compile = TRUE,
  ...
)
```

## Arguments

- x:

  Input object.

- filename:

  Base filename.

- sub_dir:

  Output directory.

- verbose:

  Logical.

- caption:

  Caption string or NULL.

- align:

  Alignment spec or NULL.

- theme:

  Theme spec or NULL.

- scolor:

  Color override or NULL.

- footnote:

  o2f_footnote or NULL.

- header_above:

  o2f_header or NULL.

- format:

  Output format.

- dpi:

  PNG resolution.

- ...:

  Passed to tt().

## Value

Output file path (invisible).
