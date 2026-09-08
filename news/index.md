# Changelog

## zzobj2fig 0.4.0

### Correctness fixes

- **Table cells now escape every character LaTeX treats specially.**
  [`sanitize_table_cells()`](https://rgt47.github.io/zzobj2fig/reference/sanitize_table_cells.md)
  handled `#`, `%`, `&` and `$`, which left out the commonest of them
  all. An underscore is a subscript in text mode, so an ordinary cell
  such as `age_years` or `SUBJ_001` stopped the compile with “Missing \$
  inserted”; `^` failed the same way, `~` rendered silently as a
  non-breaking space, and an unmatched brace broke grouping. A single
  table row containing `age_years`, `x^2` and `a~b` produced eight LaTeX
  errors. With the fix that row produces none, confirmed by compiling
  both under `pdflatex`.

  `_`, `^`, `~`, `{`, `}` and `\` are now escaped alongside the original
  four. The substitution is applied character by character in one pass,
  because a backslash is rewritten to a form containing braces and a
  second pass over `{` would mangle it.

### Known limitation, now recorded in the tests

- A cell containing a backslash followed by a letter is exempted from
  escaping entirely, so that author-supplied LaTeX markup passes
  through. The exemption is decided per cell, on the strength of one
  such sequence anywhere in it, so a cell that merely looks like markup
  keeps every other special character raw, and a raw `%` comments out
  the rest of the row. This is the existing documented behaviour and is
  unchanged; a test now pins it, so that altering it is a deliberate act
  rather than an accident.

### Tests

- New `test-latex-escaping.R` covers each special character, the
  one-pass property, vectorisation, `NA` handling, numeric coercion, and
  the markup exemption above.
- Suite grows from 408 assertions to 424.

## zzobj2fig v0.3.0

- Initial public release.
