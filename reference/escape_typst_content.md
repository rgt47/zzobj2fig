# Escape Typst content-mode special characters

Escapes characters that have special meaning in Typst content mode
(inside `[...]` blocks), such as `*`, `_`, `<`, `>`, `@`, `#`, and `$`.

## Usage

``` r
escape_typst_content(x)
```

## Arguments

- x:

  Character string.

## Value

Escaped character string safe for Typst content.
