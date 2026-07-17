# Resolve and translate theme for Typst backend

Takes a theme argument (NULL, character, or o2f_theme object), resolves
it via the existing theme system, then translates LaTeX-specific fields
to Typst-compatible values.

## Usage

``` r
resolve_typst_theme(theme, scolor = NULL)
```

## Arguments

- theme:

  Theme argument from zzo2f() call.

- scolor:

  User-provided scolor override (NULL to use theme default).

## Value

A list with Typst-compatible theme settings.
