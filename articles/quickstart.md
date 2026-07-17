# Quickstart Guide: zzobj2fig v0.2.1

This quickstart guide covers the key features in zzobj2fig v0.2.1. For
complete documentation, see the “Object Types and Themes” and “Advanced
Features” vignettes.

## Installation

``` r

# Install from GitHub
# devtools::install_github("rgt47/zzobj2fig")
```

``` r

library(zzobj2fig)
#> zzobj2fig 0.3.0 - LaTeX table generation for R
```

## Basic Usage

Convert a data frame to a cropped PDF table:

``` r

o2f(mtcars[1:6, 1:4], filename = "basic_table", sub_dir = output_dir)
```

This generates three files:

- `basic_table.tex` - LaTeX source
- `basic_table.pdf` - Cropped PDF (primary output for document
  inclusion)
- `basic_table_full.pdf` - Full PDF (before cropping)

## Interactive Terminal Graphics (zzvim-R)

When working in a kitty-compatible terminal (Kitty, Ghostty, WezTerm,
iTerm2) with zzvim-R, you can preview tables directly in the terminal
using `show_table()`:

``` r

# Display table in terminal with inline preview
show_table(mtcars[1:6, 1:4])

# With theme
show_table(mtcars[1:6, 1:4], theme = "nejm")

# Statistical objects work too
model <- lm(mpg ~ cyl + hp, data = mtcars)
show_table(model)
```

Navigate through your table history:

``` r

show_table(mtcars[1:6, 1:4])
show_table(iris[1:6, ])
show_prev()      # Go back to mtcars table
show_next()      # Forward to iris table
show_history()   # List all graphics (plots and tables)
show()           # Redisplay current
```

Tables and plots share a unified history. Use `show_history("table")` to
filter to tables only, or `show_history("plot")` for plots.

Export options:

``` r

show_table(model, theme = "nejm")
show_zoom()              # Open PDF in external viewer
show_save("table.pdf")   # Save current as PDF
show_save("table.png")   # Save current as PNG
```

## Embedding Tables in Rmd/Quarto

For reproducible documents, use
[`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) with
`graph_include()`:

``` r

# In an Rmd/qmd code chunk:
o2f(model, theme = "nejm") |> graph_include()
```

The [`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md)
function returns the path to the generated PDF, which `graph_include()`
passes to
[`knitr::include_graphics()`](https://rdrr.io/pkg/knitr/man/include_graphics.html).

This is the recommended workflow for batch rendering:

1.  **Interactive exploration**: Use `show_table()` to preview and
    compare tables
2.  **Final document**: Use `o2f() |> graph_include()` for reproducible
    embedding

``` r

# Interactive session (terminal)
show_table(model, theme = "nejm")
show_table(model, theme = "apa")
show_prev()  # compare themes

# Rmd chunk (batch mode)
o2f(model, theme = "nejm", caption = "Table 1") |> graph_include()
```

## Journal Themes

Built-in themes provide journal-specific styling:

``` r

o2f(mtcars[1:6, 1:4], theme = "nejm",
    filename = "nejm_table", sub_dir = output_dir)
```

Available themes: `"nejm"`, `"apa"`, `"nature"`, `"minimal"`

Set a global theme:

``` r

o2f_theme_set("nejm")
o2f(mtcars[1:6, 1:4])
o2f(iris[1:6, ])
```

## Statistical Objects

o2f works directly with statistical objects:

``` r

model <- lm(mpg ~ cyl + hp + wt, data = mtcars)
o2f(model, filename = "regression", sub_dir = output_dir,
    include = c("estimate", "std.error", "p.value"))
```

Supported object types include `lm`, `glm`, `anova`, `aov`, `htest`,
`matrix`, `table`, plus rms objects (`ols`, `lrm`, `cph`, `orm`, `Glm`,
`psm`) and additional types via broom integration (coxph, survreg, nls,
polr, prcomp, kmeans, lmerMod, and more).

## Inline Tables for R Markdown

Insert tables directly in R Markdown without LaTeX float positioning:

``` r

model <- lm(mpg ~ cyl + hp, data = mtcars)
o2f_inline(model,
           width = "3in",
           align = "left",
           caption = "Model Results",
           label = "tab:model",
           caption_position = "above")
```

Or use the convenience function for coefficient tables:

``` r

o2f_coef(model, caption = "Coefficients")
```

Add visual styling with frames and backgrounds:

``` r

o2f_inline(model,
           width = "3in",
           frame = TRUE,
           frame_color = "gray",
           background = "gray!5",
           inner_sep = "4pt")
```

**Note**: Add `\usepackage{caption}` to your R Markdown YAML for
captions.

## Text Wrapping Around Tables

To wrap paragraph text around a table, use the `wrapfig` LaTeX package.
First, add `\usepackage{wrapfig}` to your YAML header, then use inline R
code with
[`knitr::asis_output()`](https://rdrr.io/pkg/knitr/man/asis_output.html):

``` r

wrap_table <- function(filename, position = "r", width = "0.45\\textwidth") {
  pdf_path <- paste0(filename, "_cropped.pdf")
  knitr::asis_output(sprintf("\\begin{wrapfigure}{%s}{%s}
  \\centering
  \\includegraphics{%s}
\\end{wrapfigure}", position, width, pdf_path))
}
```

Then embed the table inline using backtick-r syntax. The following
paragraph demonstrates text wrapping:

This text flows around the table on the right. The position parameter
controls placement: “r” for right, “l” for left. The width parameter
sets how much horizontal space the table occupies. Text continues to
wrap naturally until sufficient content fills the space beside the
table. This approach works well for small summary tables that complement
the narrative without interrupting the reading flow. Notice how the
paragraph continues alongside the table, making efficient use of page
space. When the text extends beyond the table height, it returns to full
width automatically. This technique is particularly useful in research
papers where you want to discuss results while displaying the supporting
data in close proximity to the discussion. Additional text can continue
here to demonstrate that normal formatting resumes after the wrapped
section.

## Model Comparison

Compare multiple models side-by-side:

``` r

m1 <- lm(mpg ~ cyl, data = mtcars)
m2 <- lm(mpg ~ cyl + hp, data = mtcars)
m3 <- lm(mpg ~ cyl + hp + wt, data = mtcars)

o2f_regression(
  Model1 = m1, Model2 = m2, Model3 = m3,
  stars = TRUE,
  filename = "model_comparison",
  sub_dir = output_dir
)
```

## RMS Package Integration

Full support for Frank Harrell’s rms (Regression Modeling Strategies)
package, commonly used in biostatistics and clinical trials:

``` r

library(rms)
dd <- datadist(mtcars)
options(datadist = "dd")
```

### Coefficient Tables with Odds/Hazard Ratios

``` r

model <- lrm(am ~ mpg + wt, data = mtcars)
o2f(model, exponentiate = TRUE, filename = "lrm_odds_ratios")
```

### ANOVA-Style Chunk Tests

Useful for models with spline terms:

``` r

model <- ols(mpg ~ rcs(wt, 4) + cyl, data = mtcars)
o2f(model, output = "anova", filename = "ols_anova")
```

### RMS Model Comparison

``` r

m1 <- ols(mpg ~ wt, data = mtcars)
m2 <- ols(mpg ~ wt + cyl, data = mtcars)
o2f_rms_compare(Simple = m1, Full = m2, filename = "rms_comparison")
```

RMS methods:
[`o2f.ols()`](https://rgt47.github.io/zzobj2fig/reference/o2f.ols.md),
[`o2f.lrm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.lrm.md),
[`o2f.cph()`](https://rgt47.github.io/zzobj2fig/reference/o2f.cph.md),
[`o2f.orm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.orm.md),
`o2f.Glm()`,
[`o2f.psm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.psm.md),
and
[`o2f_rms_compare()`](https://rgt47.github.io/zzobj2fig/reference/o2f_rms_compare.md).

## Extensibility: Any Broom Object

For any object supported by the broom package, use
[`o2f_tidy()`](https://rgt47.github.io/zzobj2fig/reference/o2f_tidy.md):

``` r

library(survival)
cox_model <- coxph(Surv(time, status) ~ age + sex, data = lung)
o2f_tidy(cox_model, filename = "cox_results")

o2f_tidy(cox_model,
         tidy_args = list(exponentiate = TRUE, conf.int = TRUE),
         filename = "cox_hazard_ratios")
```

This provides an escape hatch for the 100+ object types broom supports.

## Captions and Footnotes

Add captions and structured footnotes:

``` r

fn <- o2f_footnote(
  general = "Data from Motor Trend US magazine (1974).",
  symbol = c("p < 0.05", "p < 0.01")
)

o2f(mtcars[1:6, 1:4],
    caption = "Motor Trend Car Road Tests",
    footnote = fn,
    filename = "captioned_table",
    sub_dir = output_dir)
```

Cross-reference labels are also supported:

``` r

o2f(mtcars[1:6, 1:4],
    caption = "Motor Trend Car Road Tests (1974)",
    label = "tab:mtcars",
    filename = "labeled_table")
```

## Spanning Headers

Group columns under spanning headers using
[`o2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/o2f_header_above.md):

``` r

hdr <- o2f_header_above(
  " " = 1,
  "Performance" = 2,
  "Engine" = 1
)

o2f(mtcars[1:6, 1:4],
    header_above = hdr,
    filename = "header_table",
    sub_dir = output_dir)
```

## Row Stripe Color Override

Override the theme’s stripe color with `scolor`:

``` r

o2f(mtcars[1:6, 1:4],
    scolor = "blue!15",
    filename = "blue_stripes",
    sub_dir = output_dir)
```

## Column Alignment

Explicit or auto-detected alignment:

``` r

o2f(iris[1:6, ], align = NULL)
o2f(mtcars[1:6, 1:4], align = c("l", "r", "r", "r"))
o2f(mtcars[1:6, 1:4], align = "c")
```

## Decimal Alignment

Use siunitx for decimal-aligned columns:

``` r

df <- data.frame(
  Item = c("A", "B", "C"),
  Value1 = c(1.5, 123.45, 12.345),
  Value2 = c(0.001, 10.1, 1000.01)
)

o2f(df, filename = "decimal_aligned", sub_dir = output_dir,
    align = list("l", o2f_siunitx(table_format = "3.3"),
                 o2f_siunitx(table_format = "4.2")))
```

## Multi-Page Tables

For large tables that span multiple pages:

``` r

o2f(mtcars,
    longtable = TRUE,
    caption = "Complete mtcars Dataset",
    filename = "long_table")
```

## Quick Reference

### Key o2f() Parameters

| Parameter     | Description                | Default     |
|:--------------|:---------------------------|:------------|
| `caption`     | LaTeX table caption        | NULL        |
| `label`       | LaTeX label for cross-refs | NULL        |
| `align`       | Column alignment (l/c/r)   | NULL (auto) |
| `longtable`   | Multi-page table support   | FALSE       |
| `crop`        | Crop PDF margins           | TRUE        |
| `crop_margin` | Margin size (pts)          | 10          |
| `theme`       | Theme name or object       | NULL        |

### Key o2f_inline() Parameters

| Parameter          | Description                      | Default  |
|:-------------------|:---------------------------------|:---------|
| `width`            | Figure width (LaTeX units)       | NULL     |
| `align`            | left, center, right              | “center” |
| `caption`          | Uses \captionof (no float)       | NULL     |
| `label`            | LaTeX cross-reference label      | NULL     |
| `caption_position` | “above” or “below”               | “above”  |
| `frame`            | Draw border around table         | FALSE    |
| `frame_color`      | Border color (xcolor syntax)     | “black”  |
| `background`       | Background color (xcolor syntax) | NULL     |
| `inner_sep`        | Padding inside frame             | “2pt”    |
| `format`           | “auto”, “pdf”, “png”             | “auto”   |

### Core Functions

| Function | Purpose |
|:---|:---|
| [`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) | Convert object to PDF table |
| [`o2f_inline()`](https://rgt47.github.io/zzobj2fig/reference/o2f_inline.md) | Inline tables for R Markdown |
| [`o2f_coef()`](https://rgt47.github.io/zzobj2fig/reference/o2f_coef.md) | Quick coefficient tables |
| [`o2f_regression()`](https://rgt47.github.io/zzobj2fig/reference/o2f_regression.md) | Compare regression models |
| [`o2f_rms_compare()`](https://rgt47.github.io/zzobj2fig/reference/o2f_rms_compare.md) | Compare rms models |
| [`o2f_tidy()`](https://rgt47.github.io/zzobj2fig/reference/o2f_tidy.md) | Any broom-supported object |
| [`o2f_theme_set()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_set.md) | Set global theme |
| [`o2f_theme_get()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_get.md) | Get current theme |
| [`check_latex_deps()`](https://rgt47.github.io/zzobj2fig/reference/check_latex_deps.md) | Check LaTeX dependencies |
| [`ensure_pdfcrop()`](https://rgt47.github.io/zzobj2fig/reference/ensure_pdfcrop.md) | Install pdfcrop via TinyTeX |

### Terminal Graphics (zzvim-R)

| Function | Purpose |
|:---|:---|
| `show_table()` | Display table in terminal |
| `show_plot()` | Display plot in terminal |
| [`show()`](https://rdrr.io/r/methods/show.html) | Redisplay last graphic |
| `show_prev()` | Previous in history |
| `show_next()` | Next in history |
| `show_history()` | List all graphics |
| `show_zoom()` | Open PDF in viewer |
| `show_save()` | Export to file |
| `graph_include()` | Embed in Rmd/qmd (batch mode) |

### S3 Methods (Base)

| Object Type | Method |
|:---|:---|
| `data.frame` | [`o2f.data.frame()`](https://rgt47.github.io/zzobj2fig/reference/o2f.default.md) |
| `matrix` | [`o2f.matrix()`](https://rgt47.github.io/zzobj2fig/reference/o2f.matrix.md) |
| `lm` | [`o2f.lm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.lm.md) |
| `glm` | [`o2f.glm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.glm.md) |
| `anova` / `aov` | [`o2f.anova()`](https://rgt47.github.io/zzobj2fig/reference/o2f.anova.md) / [`o2f.aov()`](https://rgt47.github.io/zzobj2fig/reference/o2f.anova.md) |
| `htest` | [`o2f.htest()`](https://rgt47.github.io/zzobj2fig/reference/o2f.htest.md) |

### S3 Methods (rms)

| Object Type | Method | Notes |
|:---|:---|:---|
| `ols` | [`o2f.ols()`](https://rgt47.github.io/zzobj2fig/reference/o2f.ols.md) | Ordinary least squares |
| `lrm` | [`o2f.lrm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.lrm.md) | Logistic regression (OR) |
| `cph` | [`o2f.cph()`](https://rgt47.github.io/zzobj2fig/reference/o2f.cph.md) | Cox proportional hazards (HR) |
| `orm` | [`o2f.orm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.orm.md) | Ordinal regression |
| `Glm` | `o2f.Glm()` | Generalized linear model |
| `psm` | [`o2f.psm()`](https://rgt47.github.io/zzobj2fig/reference/o2f.psm.md) | Parametric survival |

All rms methods support `output = "coef"` (default) or
`output = "anova"` for chunk tests, and `exponentiate = TRUE` for
odds/hazard ratios.

### S3 Methods (via broom)

| Object Type                   | Package    |
|:------------------------------|:-----------|
| `coxph`, `survreg`, `survfit` | survival   |
| `nls`                         | stats      |
| `polr`, `multinom`            | MASS, nnet |
| `prcomp`, `kmeans`            | stats      |
| `lmerMod`, `glmerMod`         | lme4       |
| `lme`                         | nlme       |
| `Arima`                       | stats      |

Use
[`o2f_tidy()`](https://rgt47.github.io/zzobj2fig/reference/o2f_tidy.md)
for any object type supported by broom.

### Theme Presets

| Function | Style |
|:---|:---|
| [`o2f_theme_nejm()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_nejm.md) | NEJM (medical journals) |
| [`o2f_theme_apa()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_apa.md) | APA (psychology) |
| [`o2f_theme_nature()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_nature.md) | Nature (scientific) |
| [`o2f_theme_minimal()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_minimal.md) | Clean, minimal |

## System Requirements

- R \>= 4.0
- LaTeX distribution (TeX Live, MiKTeX, TinyTeX, or MacTeX)
- `pdflatex` and `pdfcrop` executables
- Optional: ImageMagick (for PNG output and terminal graphics)
- Optional: zzvim-R plugin (for `show_table()` and terminal graphics)
- Optional: jsonlite package (for graphics history)

Check your setup:

``` r

check_latex_deps()
```

If pdfcrop is missing with TinyTeX:

``` r

ensure_pdfcrop(auto_install = TRUE)
```
