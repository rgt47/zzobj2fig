# --- regressions -------------------------------------------------
#
# Cell contents come from data, so every character LaTeX treats
# specially has to be neutralised. Only # % & $ were, which left the
# commonest of them all: an underscore is a subscript in text mode and
# stops the compile with "Missing $ inserted". Column names and subject
# identifiers are full of them. A three-cell row of age_years, x^2 and
# a~b produced eight LaTeX errors; escaped, it produces none.

esc <- zzobj2fig:::sanitize_table_cells

expect_equal(esc("age_years"), "age\\_years",
  info = "an underscore is escaped")
expect_equal(esc("SUBJ_001"), "SUBJ\\_001",
  info = "an underscore in an identifier is escaped")
expect_equal(esc("x^2"), "x\\textasciicircum{}2",
  info = "a caret is escaped, not left as a superscript")
expect_equal(esc("a~b"), "a\\textasciitilde{}b",
  info = "a tilde is escaped, not left as a non-breaking space")
expect_equal(esc("{grp}"), "\\{grp\\}",
  info = "braces are escaped so grouping stays balanced")

# The characters that already worked must keep working.
expect_equal(esc("50% CI"), "50\\% CI", info = "percent")
expect_equal(esc("A&B"), "A\\&B", info = "ampersand")
expect_equal(esc("cost $5"), "cost \\$5", info = "dollar")
expect_equal(esc("a#b"), "a\\#b", info = "hash")
expect_equal(esc("a<b>c"), "a\\textless{}b\\textgreater{}c",
  info = "angle brackets still avoid T1 ligatures")

# Escaping happens in one pass: a replacement must not be re-escaped by
# a later rule. A backslash becomes a command containing braces, and
# those braces must survive intact rather than being escaped again.
expect_equal(esc("a\\1"), "a\\textbackslash{}1",
  info = "a backslash is escaped without its own braces being escaped")

# A cell carrying author-supplied LaTeX is left alone, by design: the
# exemption is any cell holding a backslash followed by a letter.
expect_equal(esc("pre \\textbf{ok}"), "pre \\textbf{ok}",
  info = "intentional markup passes through untouched")

# The exemption is deliberately broad, and this records what it costs:
# a cell is exempted on the strength of a backslash-letter sequence
# anywhere in it, so data that merely looks like markup keeps every
# other special character raw. A percent sign left raw comments out the
# rest of the row. This is the documented behaviour, asserted here so
# that a change to it is a deliberate one.
expect_equal(esc("pre \\textbf{ok} 50%"), "pre \\textbf{ok} 50%",
  info = "an exempted cell keeps its other special characters raw")

# Vectorised, and NA-safe.
expect_equal(esc(c("a_b", "c%d")), c("a\\_b", "c\\%d"),
  info = "the whole vector is escaped")
expect_true(is.na(esc(NA_character_)),
  info = "NA stays NA rather than becoming the string 'NA'")

# Non-character input is coerced, as before.
expect_equal(esc(1:3), c("1", "2", "3"),
  info = "numeric input is coerced and needs no escaping")
