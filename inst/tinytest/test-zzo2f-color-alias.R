# Regression: a US-spelling sweep (commit 29a3988) turned the 'grey' key
# of translate_latex_color() into a duplicate 'gray' key, so the
# user-facing input 'grey' fell through to the unknown-color warning.

translate <- zzobj2fig:::translate_latex_color
lbl <- 'grey alias regression (sweep 29a3988)'

expect_silent(
  translate('grey'),
  info = paste(lbl, ': bare grey raises no warning')
)
expect_equal(
  translate('grey'), translate('gray'),
  info = paste(lbl, ': bare grey maps to the same hex as gray')
)
expect_silent(
  translate('GREY'),
  info = paste(lbl, ': uppercase GREY raises no warning')
)
expect_silent(
  translate('grey!20'),
  info = paste(lbl, ': grey!20 mixing raises no warning')
)
expect_equal(
  translate('grey!20'), translate('gray!20'),
  info = paste(lbl, ': grey!20 matches gray!20')
)
expect_silent(
  translate('Grey!5'),
  info = paste(lbl, ': mixed-case Grey!5 raises no warning')
)
expect_warning(
  translate('notacolor'),
  pattern = 'Unrecognized color',
  info = paste(lbl, ': unknown names still warn')
)
