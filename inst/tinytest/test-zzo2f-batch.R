# Tests for zzo2f Batch E (batch + inline + knitr engine).

# --- zzo2f_batch_spec constructor ---

spec <- zzo2f_batch_spec(mtcars, "mt", caption = "Motor Trend")
expect_inherits(spec, "zzo2f_batch_spec")
expect_equal(spec$filename, "mt")
expect_equal(spec$args$caption, "Motor Trend")

expect_error(
  zzo2f_batch_spec(list(x = 1), "mt"),
  "must be a data frame"
)
expect_error(
  zzo2f_batch_spec(mtcars, c("a", "b")),
  "single character string"
)

# print method
out <- capture.output(print(spec))
expect_true(any(grepl("zzo2f batch spec", out)))
expect_true(any(grepl("mt", out)))

# --- zzo2f_batch input validation ---

expect_error(zzo2f_batch("not a list"), "must be a list")
expect_error(zzo2f_batch(list()), "must not be empty")
expect_error(
  zzo2f_batch(list(a = mtcars, b = "oops")),
  "must be data frames"
)

# --- zzo2f_batch_advanced input validation ---

expect_error(zzo2f_batch_advanced("nope"), "must be a list")
expect_error(
  zzo2f_batch_advanced(list(list(filename = "x"))),
  "zzo2f_batch_spec objects"
)

# --- Engine registration ---

has_knitr <- requireNamespace("knitr", quietly = TRUE)

if (has_knitr) {
  register_zzo2f_engine()
  engines <- knitr::knit_engines$get()
  expect_true("zzo2f" %in% names(engines))
}

# --- End-to-end batch rendering with Typst ---

has_typst <- nzchar(Sys.which("typst"))
has_tt <- requireNamespace("tinytable", quietly = TRUE)

if (has_typst && has_tt) {
  tmp <- file.path(tempdir(), "zzo2f_batch_test")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)

  res <- zzo2f_batch(
    list(tab_a = mtcars[1:3, 1:3],
         tab_b = iris[1:3, 1:3]),
    sub_dir = tmp
  )
  expect_equal(length(res), 2L)
  expect_true(all(file.exists(unlist(res))))

  # advanced batch with per-table overrides
  specs <- list(
    zzo2f_batch_spec(mtcars[1:2, 1:2], "adv_a"),
    zzo2f_batch_spec(iris[1:2, 1:2],   "adv_b",
                     caption = "Iris demo")
  )
  res2 <- zzo2f_batch_advanced(specs, sub_dir = tmp)
  expect_equal(names(res2), c("adv_a", "adv_b"))
  expect_true(all(file.exists(unlist(res2))))

  # inline (outside knitr) returns a path
  path <- zzo2f_inline(
    mtcars[1:2, 1:2],
    filename = "inline_demo",
    sub_dir = tmp,
    format = "pdf"
  )
  expect_true(file.exists(path))
}
