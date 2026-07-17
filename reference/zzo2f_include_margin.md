# Include a rendered table in the page margin (approximation)

Emits `#place(right, dx: ...)[...]` which floats the figure toward the
page margin. True marginfigure semantics (automatic margin-parallel
placement) require the document to reserve margin space via
`#set page(margin: (right: ...))`.

## Usage

``` r
zzo2f_include_margin(
  path,
  caption = NULL,
  label = NULL,
  width = "4cm",
  offset = "100%",
  method = NULL,
  cat = TRUE
)
```

## Arguments

- path:

  Path to the image file.

- caption:

  Character or NULL.

- label:

  Character or NULL.

- width:

  Width spec.

- method:

  Ignored for Typst; retained for API symmetry with
  [`o2f_include_margin()`](https://rgt47.github.io/zzobj2fig/reference/o2f_include_margin.md).

- cat:

  Logical.

## Value

Character; printed when `cat = TRUE`.
