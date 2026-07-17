# Create decimal-aligned column specification (convenience wrapper)

Convenience function to create decimal-aligned columns. Returns
alignment string and updates extra_packages.

## Usage

``` r
o2f_decimal(integers = 3, decimals = 2)
```

## Arguments

- integers:

  Maximum integer digits before decimal point.

- decimals:

  Maximum decimal digits after decimal point.

## Value

A o2f_siunitx object.

## Examples

``` r
if (FALSE) { # \dontrun{
# Align numbers up to 99.999
o2f(df, align = c("l", o2f_decimal(2, 3), o2f_decimal(2, 3)))
} # }
```
