# Font directive for Typst (parallel to `fontspec()`)

Font directive for Typst (parallel to
[`fontspec()`](https://rgt47.github.io/zzobj2fig/reference/fontspec.md))

## Usage

``` r
zzo2f_font(main_font = NULL, mono_font = NULL, sans_font = NULL)
```

## Arguments

- main_font:

  Character or NULL. Typst font family for body text.

- mono_font:

  Character or NULL. Font for raw / code blocks.

- sans_font:

  Ignored; Typst has no sans-specific setter. The argument is retained
  for API symmetry with
  [`fontspec()`](https://rgt47.github.io/zzobj2fig/reference/fontspec.md);
  users who need separate sans handling should write a `#show` rule.

## Value

Character vector of Typst directives.
