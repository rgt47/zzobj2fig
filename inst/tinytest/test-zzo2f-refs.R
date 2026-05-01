# Tests for zzo2f Batch C reference/note helpers.

# --- zzo2f_footnote delegates to o2f_footnote ---

fn <- zzo2f_footnote(general = "Data source: demo.",
                     symbol = c("p < 0.05", "p < 0.01"))
expect_inherits(fn, "o2f_footnote")
expect_equal(fn$general, "Data source: demo.")
expect_equal(length(fn$symbol), 2L)

# --- zzo2f_mark emits Typst superscript ---

expect_equal(
  zzo2f_mark("23.5", 1, "symbol"),
  "23.5#super[*]"
)
expect_equal(
  zzo2f_mark("17.0", 2, "number"),
  "17.0#super[2]"
)
expect_equal(
  zzo2f_mark("9.2", 3, "alphabet"),
  "9.2#super[c]"
)

# Symbol index beyond the predefined family falls back to the
# numeric marker rather than erroring.
expect_equal(
  zzo2f_mark("x", 9, "symbol"),
  "x#super[9]"
)

expect_error(zzo2f_mark(c("a", "b"), 1), "single character")
expect_error(zzo2f_mark("a", -1), "positive integer")
expect_error(zzo2f_mark("a", 1, type = "bogus"), "should be one of")

# --- zzo2f_ref ---

expect_equal(
  zzo2f_ref("tab-demographics", cat = FALSE),
  "@tab-demographics"
)
expect_equal(
  zzo2f_ref("tab-demographics", supplement = "Table", cat = FALSE),
  "#ref(<tab-demographics>, supplement: [Table])"
)

expect_error(zzo2f_ref(""), "non-empty")
expect_error(zzo2f_ref(c("a", "b")), "single non-empty")

# cat = TRUE prints and returns invisibly
out <- capture.output(res <- zzo2f_ref("x", cat = TRUE))
expect_equal(out, "@x")
expect_equal(res, "@x")

# --- End-to-end: footnote threaded through zzo2f() ---

has_typst <- nzchar(Sys.which("typst"))
has_tt <- requireNamespace("tinytable", quietly = TRUE)

if (has_typst && has_tt) {
  tmp <- file.path(tempdir(), "zzo2f_refs_test")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)

  out <- zzo2f(
    mtcars[1:3, 1:3],
    filename = "fn_demo",
    sub_dir = tmp,
    footnote = zzo2f_footnote(general = "Demo footnote."),
    compile = FALSE
  )
  expect_inherits(out, "zzo2f_source")
  expect_true(any(grepl("Demo footnote", out)))
}
