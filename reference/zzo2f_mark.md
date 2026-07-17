# Footnote marker for Typst cell content

Append a superscript footnote marker to a cell value using Typst's
`super()` function. Parallel to
[`o2f_mark()`](https://rgt47.github.io/zzobj2fig/reference/o2f_mark.md)
which emits `\textsuperscript{}`.

## Usage

``` r
zzo2f_mark(text, mark, type = c("symbol", "number", "alphabet"))
```

## Arguments

- text:

  Character. Cell text to decorate.

- mark:

  Integer. Index into the selected marker family.

- type:

  One of `"symbol"`, `"number"`, `"alphabet"`.

## Value

Character string with embedded Typst superscript.

## Examples

``` r
if (FALSE) { # \dontrun{
df$value[1] <- zzo2f_mark("23.5", 1, "symbol")
} # }
```
