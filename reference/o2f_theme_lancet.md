# Lancet theme

Theme following The Lancet journal table styling. Characterized by a
clean, minimal appearance with sans-serif font (Helvetica), no row
shading, and booktabs-style horizontal rules.

## Usage

``` r
o2f_theme_lancet()
```

## Value

A o2f_theme object.

## Details

The Lancet reformats all submitted tables to match their house style.
Key characteristics based on their formatting guidelines:

- Sans-serif font (Helvetica/Arial family)

- No alternating row shading (clean appearance)

- Booktabs-style horizontal rules

- Compact layout (75mm single column, 154mm double column)

- Small font size for space efficiency

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_theme_set(o2f_theme_lancet())
o2f(mtcars[1:10, 1:5], filename = "lancet_table")
} # }
```
