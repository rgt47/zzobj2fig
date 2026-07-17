# Clear the o2f cache

Remove all cached files.

## Usage

``` r
o2f_cache_clear(older_than = NULL)
```

## Arguments

- older_than:

  Numeric. Only remove files older than this many days. If NULL
  (default), removes all cached files.

## Value

Invisibly returns the number of files removed.

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_cache_clear()
o2f_cache_clear(older_than = 7)
} # }
```
