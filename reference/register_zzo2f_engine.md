# Register the zzo2f knitr engine

Registers the `zzo2f` chunk engine with knitr so that
```` ```{zzo2f, ...} ```` blocks render via the Typst backend. Normally
called automatically in `.onLoad()`.

## Usage

``` r
register_zzo2f_engine()
```

## Value

NULL (invisible).
