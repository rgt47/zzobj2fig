# Typst Figure-Inclusion Helpers

Emit Typst source fragments that embed a rendered table image (typically
from a prior
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) call)
into a surrounding `.typ` document. Parallel in purpose to the
`o2f_include*` family but using Typst primitives (`#figure`, `#image`,
`#grid`, `#place`).

## Details

Three semantic gaps between the LaTeX and Typst inclusion models are
flagged here:

- `wrapfigure` (text wrapping around a figure) has no direct Typst
  equivalent.
  [`zzo2f_include_wrap()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_include_wrap.md)
  emits a `#place(..., float: true)` approximation; text does not
  literally wrap.

- `marginfigure` / `\marginpar` are approximated via
  `#place(right, dx: 100%, ...)`. This works inside a
  `#set page(margin: (right: ...))` block; users must arrange the page
  layout themselves.

- LaTeX float placement specifiers (`htbp`) have no clean Typst analog.
  The `position` argument is accepted for API symmetry but ignored.
