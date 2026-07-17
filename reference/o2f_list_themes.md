# List available themes

List all available themes, including both built-in themes and registered
custom themes.

## Usage

``` r
o2f_list_themes(builtin_only = FALSE)
```

## Arguments

- builtin_only:

  Logical. If TRUE, only list built-in themes. Default FALSE.

## Value

Character vector of available theme names.

## Examples

``` r
o2f_list_themes()
#> [1] "minimal" "apa"     "nature"  "nejm"    "lancet" 
o2f_list_themes(builtin_only = TRUE)
#> [1] "minimal" "apa"     "nature"  "nejm"    "lancet" 
```
