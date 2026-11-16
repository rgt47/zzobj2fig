fws <- zzobj2fig:::format_with_stars
lbl <- "star-count defect: format_with_stars"

p <- c(0.2, 0.03, 0.005, 0.0001, 1e-8)
est <- rep(1.5, length(p))
want <- c("1.5", "1.5*", "1.5**", "1.5***", "1.5***")

expect_identical(fws(est, p, c(0.05, 0.01, 0.001), 3), want,
  info = paste(lbl, "default thresholds give 0/1/2/3 stars"))
expect_identical(fws(est, p, TRUE, 3), want,
  info = paste(lbl, "stars = TRUE uses the default thresholds"))
expect_identical(fws(est, p, c(0.001, 0.05, 0.01), 3), want,
  info = paste(lbl, "threshold order does not change the count"))

expect_identical(
  fws(rep(1.5, 3), c(0.05, 0.01, 0.001), c(0.05, 0.01, 0.001), 3),
  c("1.5", "1.5*", "1.5**"),
  info = paste(lbl, "p equal to a threshold does not earn that star"))

expect_identical(fws(c(1.5, NA), c(NA, 0.001), c(0.05, 0.01, 0.001), 3),
  c("1.5", ""),
  info = paste(lbl, "NA p-value gives no stars; NA estimate is blank"))

expect_identical(fws(est, p, FALSE, 3), rep("1.5", length(p)),
  info = paste(lbl, "stars = FALSE suppresses stars"))

expect_identical(
  fws(rep(1.5, 3), c(0.07, 0.03, 0.0001), c(0.1, 0.05, 0.01, 0.001), 3),
  c("1.5*", "1.5**", "1.5****"),
  info = paste(lbl, "more than three thresholds give one star each"))

if (nzchar(Sys.which("pdflatex"))) {
  set.seed(1)
  d <- data.frame(x1 = rnorm(200), x2 = rnorm(200))
  d$y <- 3 * d$x1 + rnorm(200)
  m <- lm(y ~ x1 + x2, data = d)
  out <- file.path(tempdir(), "stars_regression")
  try(o2f_regression(M1 = m, filename = "reg", sub_dir = out,
    o2f_args = list(crop = FALSE)), silent = TRUE)
  tex <- list.files(out, pattern = "[.]tex$", full.names = TRUE)
  tex_lines <- if (length(tex) > 0) readLines(tex[1]) else character(0)
  expect_true(any(grepl("x1 & 3.078***", tex_lines, fixed = TRUE)),
    info = "star-count defect: o2f_regression .tex shows *** for p < 1e-6")
}
