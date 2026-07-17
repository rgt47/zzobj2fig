# Preamble Emitters for the Typst Backend

Parallel to the LaTeX preamble helpers (`babel`, `fontspec`, `geometry`)
but emit Typst directives (`#set text(lang: ...)`,
`#set text(font: ...)`, `#set page(...)`). Each returns a character
vector of directive lines that can be prepended to a `.typ` document or
passed to `zzo2f(..., preamble = ...)` when that consumption site lands.

## Details

These helpers are intentionally thin. Typst users normally write
preamble directives directly in their `.typ` source; these exist so that
code migrating from `o2f_*` has naming-consistent alternatives. Flagged
for review: keep as a programmatic-preamble API, or deprecate in favor
of raw Typst?
