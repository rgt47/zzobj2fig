# Changelog

## zzobj2fig (development version)

### Correctness fixes

- **Significance stars now reflect the tightest threshold satisfied.**
  [`format_with_stars()`](https://rgt47.github.io/zzobj2fig/reference/format_with_stars.md),
  which produces the stars in
  [`o2f_regression()`](https://rgt47.github.io/zzobj2fig/reference/o2f_regression.md),
  [`zzo2f_regression()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_regression.md),
  [`o2f_rms_compare()`](https://rgt47.github.io/zzobj2fig/reference/o2f_rms_compare.md)
  and
  [`zzo2f_rms_compare()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_rms_compare.md),
  sorted the thresholds in decreasing order and took the first one the
  p-value fell below. That is always the loosest threshold, so every
  significant estimate received a single star: a coefficient with p \<
  1e-6 was rendered `3.078*`. An estimate now receives one star per
  threshold its p-value is strictly below, so the default
  `c(0.05, 0.01, 0.001)` gives `*` p \< 0.05, `**` p \< 0.01 and `***` p
  \< 0.001, independent of the order in which thresholds are supplied. A
  p-value exactly equal to a threshold does not earn that star, and a
  missing p-value earns none. Tables that previously showed one star for
  highly significant estimates will now show two or three. No
  significance legend is generated automatically.

- **The color name ‘grey’ is accepted again by the Typst engine.** A
  spelling sweep replaced the ‘grey’ entry in the internal LaTeX-to-hex
  color table with a second ‘gray’ entry, so
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
  colors such as `'grey'` or `'grey!20'` triggered an “Unrecognized
  color” or “Unknown LaTeX color” warning. The rendered color was
  unaffected, because the fallback for unknown colors is the same gray.
  ‘gray’ (alias ‘grey’) is now accepted without a warning, in any letter
  case.

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
