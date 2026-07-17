# knitr engine for Typst-rendered tables

Used by
[`register_zzo2f_engine()`](https://rgt47.github.io/zzobj2fig/reference/register_zzo2f_engine.md)
to handle chunks declared with engine `zzo2f` (e.g.
`zzo2f, zzo2f.caption="...", ...`). Chunk body should evaluate to a data
frame.

## Usage

``` r
zzo2f_engine(options)
```

## Arguments

- options:

  knitr chunk options.

## Value

Engine output.
