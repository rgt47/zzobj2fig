# Cross-reference to a labeled table (Typst backend)

Construct a Typst reference string for a labeled element. The returned
string can be pasted into surrounding prose in a `.typ` document. Typst
has no direct analog of LaTeX's `\pageref` or `\nameref`; those
LaTeX-only types are not supported here.

## Usage

``` r
zzo2f_ref(label, supplement = NULL, cat = TRUE)
```

## Arguments

- label:

  Character. The label name, without angle brackets.

- supplement:

  Character or NULL. Optional supplement text overriding Typst's default
  (e.g., "Table", "Figure").

- cat:

  Logical. If TRUE (default), print the string via
  [`cat()`](https://rdrr.io/r/base/cat.html) for inline use in R
  Markdown; otherwise return it.

## Value

Character string of the form `@label` (or with a supplement,
`#ref(<label>, supplement: [Table])`).

## Examples

``` r
if (FALSE) { # \dontrun{
zzo2f_ref("tab-demographics", cat = FALSE)
} # }
```
