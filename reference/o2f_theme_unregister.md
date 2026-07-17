# Unregister a custom theme

Remove a previously registered custom theme.

## Usage

``` r
o2f_theme_unregister(name)
```

## Arguments

- name:

  Character string. Name of the theme to unregister.

## Value

Invisibly returns TRUE if the theme was removed, FALSE if it was not
found.

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_theme_unregister("jama")
} # }
```
