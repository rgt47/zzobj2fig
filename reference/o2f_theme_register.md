# Register a custom theme

Register a custom theme so it can be referenced by name in o2f() calls
and o2f_theme_set(). This allows you to define journal-specific themes
once and reuse them throughout your project.

## Usage

``` r
o2f_theme_register(theme, name = NULL, overwrite = FALSE)
```

## Arguments

- theme:

  A o2f_theme object created with o2f_theme().

- name:

  Optional name to register the theme under. If NULL, uses the theme's
  internal name.

- overwrite:

  Logical. If TRUE, overwrites any existing theme with the same name.
  Default FALSE.

## Value

Invisibly returns the theme object.

## Examples

``` r
if (FALSE) { # \dontrun{
# Create and register a custom JAMA theme
jama <- o2f_theme(
  name = "jama",
  scolor = "white",
  header_bold = TRUE,
  font_size = "small",
  booktabs = TRUE,
  striped = FALSE
)
o2f_theme_register(jama)

# Now use it by name
o2f(mtcars, theme = "jama")

# Or set it globally
o2f_theme_set("jama")
} # }
```
