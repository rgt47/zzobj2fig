# Quickstart Guide: zzo2f (Typst Backend)

This quickstart covers
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md), the
Typst-based alternative to
[`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md). Where
[`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) requires a
full LaTeX distribution (pdflatex + pdfcrop + ImageMagick),
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) needs
only two lightweight dependencies: the tinytable R package and the Typst
CLI (~40 MB binary). Typst auto-sizes pages, so no cropping step is
needed.

Both functions share the same theme system. The key difference is the
compilation backend: LaTeX vs Typst.

## Installation

``` r

# R package
install.packages("tinytable")

# Typst CLI
# macOS:   brew install typst
# Linux:   curl -fsSL https://typst.community | sh
# Windows: winget install --id Typst.Typst
```

``` r

library(zzobj2fig)
#> zzobj2fig 0.3.0 - LaTeX table generation for R
```

Verify that both dependencies are available:

``` r

check_typst_deps()
```

## Basic Usage

Convert a data frame to a table image:

``` r

zzo2f(
  mtcars[1:6, 1:4],
  filename = "basic_table",
  sub_dir = output_dir,
  format = "png"
)
```

By default,
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
produces a PDF. Here we use `format = "png"` for display. The output is
a single file with no intermediate artifacts (no `.tex`, no `_full.pdf`,
no cropping step).

## Output Formats

[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
supports three output formats via the `format` argument:

``` r

zzo2f(mtcars[1:6, 1:4],
      filename = "fmt_pdf",
      sub_dir = output_dir,
      format = "pdf")
```

``` r

zzo2f(mtcars[1:6, 1:4],
      filename = "fmt_png",
      sub_dir = output_dir,
      format = "png",
      dpi = 300)
```

``` r

zzo2f(mtcars[1:6, 1:4],
      filename = "fmt_svg",
      sub_dir = output_dir,
      format = "svg")
```

PNG output respects the `dpi` argument (default 300). SVG output
produces resolution-independent vector graphics suitable for web
documents.

## Journal Themes

[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) reuses
the same theme system as
[`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md). All
built-in themes translate automatically to Typst styling:

``` r

zzo2f(mtcars[1:6, 1:4],
      theme = "nejm",
      filename = "nejm_table",
      sub_dir = output_dir,
      format = "png")
```

``` r

zzo2f(mtcars[1:6, 1:4],
      theme = "apa",
      filename = "apa_table",
      sub_dir = output_dir,
      format = "png")
```

Available themes: `"nejm"`, `"apa"`, `"nature"`, `"lancet"`,
`"minimal"`.

The global theme set via
[`o2f_theme_set()`](https://rgt47.github.io/zzobj2fig/reference/o2f_theme_set.md)
is respected by
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) as
well:

``` r

o2f_theme_set("nejm")
zzo2f(mtcars[1:6, 1:4], filename = "auto_themed")
```

## Captions and Footnotes

``` r

fn <- o2f_footnote(
  general = "Data from Motor Trend US magazine (1974).",
  symbol = c("p < 0.05", "p < 0.01")
)

zzo2f(mtcars[1:6, 1:4],
      caption = "Motor Trend Car Road Tests",
      footnote = fn,
      filename = "captioned_table",
      sub_dir = output_dir,
      format = "png")
```

Footnotes from
[`o2f_footnote()`](https://rgt47.github.io/zzobj2fig/reference/o2f_footnote.md)
are translated to plain-text notes below the table. General, numbered,
alphabetic, and symbol notation styles are all supported.

## Spanning Headers

Group columns under spanning headers using
[`o2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/o2f_header_above.md):

``` r

hdr <- o2f_header_above(
  " " = 1,
  "Performance" = 2,
  "Engine" = 1
)

zzo2f(mtcars[1:6, 1:4],
      header_above = hdr,
      filename = "header_table",
      sub_dir = output_dir,
      format = "png")
```

## Column Alignment

Alignment is auto-detected (numeric columns right-aligned, others
left-aligned) or set explicitly:

``` r

zzo2f(iris[1:6, ],
      align = c("r", "r", "r", "r", "l"),
      filename = "aligned_table",
      sub_dir = output_dir,
      format = "png")
```

A single character applies to all columns:

``` r

zzo2f(mtcars[1:6, 1:4], align = "c")
```

## Row Stripe Color Override

Override the theme’s stripe color with `scolor`:

``` r

zzo2f(mtcars[1:6, 1:4],
      scolor = "blue!15",
      filename = "blue_stripes",
      sub_dir = output_dir,
      format = "png")
```

LaTeX color syntax (`"blue!15"`, `"gray!5"`) is automatically translated
to hex. Hex values (`"#E6E6FF"`) pass through unchanged.

## Working with Statistical Objects

[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
supports S3 dispatch for common statistical objects (`lm`, `glm`,
`anova`, `aov`, `htest`), automatically extracting, rounding, and
formatting coefficients:

``` r

model <- lm(mpg ~ cyl + hp + wt, data = mtcars)

zzo2f(model,
      caption = "Linear Model Coefficients",
      theme = "nejm",
      filename = "lm_typst",
      sub_dir = output_dir,
      format = "png")
```

For full control over column selection, you can also use the `include`
parameter or pass a pre-formatted data frame directly.

## Model Comparison

Compare multiple models side-by-side with
[`zzo2f_regression()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_regression.md):

``` r

m1 <- lm(mpg ~ cyl, data = mtcars)
m2 <- lm(mpg ~ cyl + hp, data = mtcars)
m3 <- lm(mpg ~ cyl + hp + wt, data = mtcars)

zzo2f_regression(
  Model1 = m1, Model2 = m2, Model3 = m3,
  stars = TRUE,
  filename = "model_comparison",
  sub_dir = output_dir,
  format = "png"
)
```

A separator line is automatically inserted between coefficient rows and
summary statistics (N, R-squared, Adj. R-squared).

## Helper Functions

The [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
pipeline supports a family of `zzo2f_*` helpers that parallel the
LaTeX-side `o2f_*` helpers. These return small spec objects or Typst
source fragments. The sections below show representative usage.

### Cell-level formatting

Formatting specs are consumed by
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) via
its `formats` parameter, which accepts a single spec or a list of specs.

``` r

library(zzobj2fig)

df <- mtcars[1:4, 1:4]

zzo2f(
  df,
  filename = 'styled_demo',
  formats = list(
    zzo2f_bold_col('mpg'),
    zzo2f_italic_col('hp'),
    zzo2f_color_row(c(1, 3), background = 'gray!10'),
    zzo2f_highlight(
      function(x) as.numeric(x) > 20,
      background = 'yellow!30'
    ),
    zzo2f_decimal(c('mpg', 'disp'), digits = 1)
  )
)
```

[`zzo2f_format()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_format.md)
is the general constructor; the other five are thin wrappers for common
cases.

### Collapsed rows and spanning headers

[`zzo2f_collapse_rows()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_collapse_rows.md)
visually merges consecutive identical values in the specified columns;
[`zzo2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_header_above.md)
delegates to
[`o2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/o2f_header_above.md)
and is consumed via `header_above`.

``` r

df <- data.frame(
  Group    = rep(c('A', 'B'), each = 3),
  Subgroup = rep(c('x', 'y', 'z'), 2),
  Value    = 1:6
)

zzo2f(
  df,
  filename = 'collapsed',
  collapse_rows = zzo2f_collapse_rows('Group'),
  header_above = zzo2f_header_above(
    ' ' = 1, 'Identifier' = 2
  )
)
```

### Footnotes, marks, and cross-references

[`zzo2f_footnote()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_footnote.md)
is an alias for
[`o2f_footnote()`](https://rgt47.github.io/zzobj2fig/reference/o2f_footnote.md);
the spec is backend-agnostic.
[`zzo2f_mark()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_mark.md)
inserts Typst superscript markers;
[`zzo2f_ref()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_ref.md)
returns a Typst cross-reference string (`@label`).

``` r

df <- mtcars[1:3, 1:3]
df$mpg[1] <- zzo2f_mark(as.character(df$mpg[1]), 1, 'symbol')

zzo2f(
  df,
  filename = 'fn_demo',
  footnote = zzo2f_footnote(
    general = 'Source: mtcars (Motor Trend, 1974).',
    symbol = c('Leading observation.')
  )
)

ref_str <- zzo2f_ref('tab-fn-demo', cat = FALSE)
```

### Batch rendering

``` r

tables <- list(
  cars   = mtcars[1:5, 1:3],
  irises = iris[1:5,   1:3]
)
zzo2f_batch(tables, sub_dir = 'figures', theme = 'nejm')

# Per-table overrides
specs <- list(
  zzo2f_batch_spec(mtcars[1:3, 1:3], 'mt_small'),
  zzo2f_batch_spec(iris[1:3,   1:3], 'ir_small',
                   theme = 'apa')
)
zzo2f_batch_advanced(specs, sub_dir = 'figures')
```

### Fitted models

[`zzo2f_tidy()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_tidy.md)
routes a
[`broom::tidy()`](https://generics.r-lib.org/reference/tidy.html) output
through
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md);
[`zzo2f_coef()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_coef.md)
is an inline wrapper for use in R Markdown;
[`zzo2f_rms_compare()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_rms_compare.md)
builds a side-by-side comparison of `rms` models.

``` r

m <- lm(mpg ~ cyl + hp, data = mtcars)
zzo2f_tidy(m, filename = 'lm_tidy', digits = 2)
zzo2f_coef(m, caption = 'Model coefficients.')
```

### Embedding a rendered table in a Typst document

The `zzo2f_include*()` helpers emit Typst source for embedding a
previously rendered PDF into a host `.typ` document. They are invoked
for their side effect (print-and-return) in R Markdown chunks, or
captured via `cat = FALSE`.

``` r

zzo2f(mtcars[1:3, 1:3], filename = 'inner')

zzo2f_include(
  'inner',
  caption = 'Demo embedded table.',
  label = 'tab-inner',
  cat = FALSE
)
#> "#align(center)[#figure(image(\"inner.pdf\", width: 100%), ..."

# Side-by-side
zzo2f_include_sidebyside(
  'fig/a', 'fig/b',
  main_caption = 'Comparison',
  cat = FALSE
)
```

Note that Typst refuses paths outside its project root, so place the
host `.typ` file in the same directory as (or above) the referenced
PDFs.

### Preamble directives

Programmatic emitters for `.typ` preamble lines:

``` r

preamble <- c(
  zzo2f_page(paper = 'a4',
             margin = list(x = '2cm', y = '2cm')),
  zzo2f_textlang('en'),
  zzo2f_font(main_font = 'Libertinus Serif')
)
```

These are intentionally thin; most users will write preamble directives
directly in their `.typ` source.

### Advanced: source-level post-processing

For users who want to transform the generated Typst source before
compilation, pass `compile = FALSE` to
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md):

``` r

src <- zzo2f(
  mtcars[1:3, 1:3],
  filename = 'raw_demo',
  compile = FALSE
)
# src is a character vector of .typ lines with attributes
# recording filename / sub_dir / format.

src <- c('// Added by hand', src)
zzo2f_compile(src, filename = 'raw_demo')
```

## Quick Reference

### zzo2f() Parameters

| Parameter | Description | Default |
|:---|:---|:---|
| `filename` | Base name (no extension) | deparsed input |
| `sub_dir` | Output directory | `"analysis/figures"` |
| `format` | `"pdf"`, `"png"`, or `"svg"` | `"pdf"` |
| `dpi` | PNG resolution | 300 |
| `caption` | Table caption | NULL |
| `align` | Column alignment (l/c/r) | NULL (auto) |
| `theme` | Theme name or object | NULL |
| `scolor` | Row stripe color override | NULL |
| `footnote` | [`o2f_footnote()`](https://rgt47.github.io/zzobj2fig/reference/o2f_footnote.md) object | NULL |
| `header_above` | [`o2f_header_above()`](https://rgt47.github.io/zzobj2fig/reference/o2f_header_above.md) object | NULL |
| `verbose` | Print progress messages | FALSE |

### New parameters added by the helper set

| Parameter | Description |
|:---|:---|
| `formats` | A `zzo2f_format` spec or list of specs. |
| `collapse_rows` | A [`zzo2f_collapse_rows()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_collapse_rows.md) spec. |
| `compile` | If `FALSE`, return Typst source instead of compiling. |

### Parameters from o2f() still without a Typst equivalent

- `extra_packages`, `document_class`: preamble is built by
  [`zzo2f_page()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_page.md)
  /
  [`zzo2f_font()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_font.md)
  /
  [`zzo2f_textlang()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_textlang.md)
  or by the user directly.
- `caption_short`: Typst `#figure` has no short-caption concept.
- `crop`, `crop_margin`: Typst auto-sizes the page; cropping is
  unnecessary.
- `longtable`: multi-page tables are not yet wired through
  [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md)
  although Typst itself supports them natively.

### Choosing Between o2f() and zzo2f()

|  | [`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) | [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) |
|:---|:---|:---|
| **Backend** | LaTeX (kableExtra) | Typst (tinytable) |
| **Dependencies** | pdflatex + pdfcrop + ImageMagick | Typst CLI (~40 MB) |
| **Output formats** | PDF (+ PNG/SVG via convert) | PDF, PNG, SVG natively |
| **S3 dispatch** | Yes (lm, glm, rms, …) | Yes (lm, glm, anova, htest) |
| **Cropping** | Required (pdfcrop) | Not needed (auto-sized) |
| **Decimal alignment** | siunitx S columns | [`zzo2f_siunitx()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_siunitx.md) via Typst `metro` (partial) |
| **Multi-page tables** | longtable | Not yet wired through [`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) |
| **Collapse rows** | multirow | [`zzo2f_collapse_rows()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_collapse_rows.md) (cell-emptying) |
| **Cell formatting** | [`o2f_format()`](https://rgt47.github.io/zzobj2fig/reference/o2f_format.md) family | [`zzo2f_format()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f_format.md) family |
| **Figure inclusion** | `o2f_include*()` family | `zzo2f_include*()` family |
| **Batch rendering** | `o2f_batch*()` family | `zzo2f_batch*()` family |
| **Stat helpers** | `o2f_tidy`, `o2f_coef`, `o2f_rms_compare` | `zzo2f_tidy`, `zzo2f_coef`, `zzo2f_rms_compare` |

Use [`o2f()`](https://rgt47.github.io/zzobj2fig/reference/o2f.md) when
you need multi-page tables or the full `siunitx` option set. Use
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) when
you want fast compilation with minimal system dependencies or native
PNG/SVG output without ImageMagick. The helper APIs are now close to
symmetric across the two backends.

## System Requirements

- R \>= 4.1 (for native pipe `|>`)
- tinytable R package
- Typst CLI (\>= 0.11)

Check your setup:

``` r

check_typst_deps()
```
