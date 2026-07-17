# Resolve a Typst image path

Resolve a Typst image path

## Usage

``` r
resolve_typst_path(path)
```

## Arguments

- path:

  Character. Input path, with or without extension.

## Value

Character path ending in `.pdf` (Typst can embed PDF directly). Unlike
[`resolve_pdf_path()`](https://rgt47.github.io/zzobj2fig/reference/resolve_pdf_path.md),
no `_cropped` suffix is added, because
[`zzo2f()`](https://rgt47.github.io/zzobj2fig/reference/zzo2f.md) emits
already-sized Typst output.
