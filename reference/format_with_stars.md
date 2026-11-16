# Format estimates with significance stars

Appends one star per threshold in `stars` that the p-value falls
strictly below. With the default thresholds this gives `*` for p \<
0.05, `**` for p \< 0.01 and `***` for p \< 0.001; a p-value equal to a
threshold does not earn that star. A missing p-value produces no stars.

## Usage

``` r
format_with_stars(estimates, pvals, stars, digits)
```
