# Apply theme settings to o2f parameters

Merge theme settings with explicitly provided o2f() arguments. Explicit
arguments take precedence over theme settings.

## Usage

``` r
apply_theme_settings(
  theme,
  scolor = NULL,
  document_class = NULL,
  extra_packages = NULL
)
```

## Arguments

- theme:

  A o2f_theme object.

- scolor:

  User-provided scolor (NULL to use theme default).

- document_class:

  User-provided document_class (NULL to use theme default).

- extra_packages:

  User-provided extra_packages (combined with theme packages).

## Value

A list with resolved parameter values.
