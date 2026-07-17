# Set the global o2f theme

Set the default theme for all subsequent o2f() calls. The theme can be
overridden by passing a theme argument directly to o2f().

## Usage

``` r
o2f_theme_set(theme)
```

## Arguments

- theme:

  A o2f_theme object or character string naming a built-in theme
  ("minimal", "apa", "nature", "nejm").

## Value

Invisibly returns the previous theme.

## Examples

``` r
if (FALSE) { # \dontrun{
old_theme <- o2f_theme_set("nejm")
o2f(mtcars)
o2f_theme_set(old_theme)
} # }
```
