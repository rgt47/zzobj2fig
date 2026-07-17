# Compute hash for cache key

Compute a hash of the inputs to o2f for use as a cache key.

## Usage

``` r
compute_cache_hash(
  df,
  scolor = NULL,
  extra_packages = NULL,
  document_class = NULL,
  caption = NULL,
  label = NULL,
  align = NULL,
  longtable = FALSE,
  theme = NULL
)
```

## Arguments

- df:

  The data frame being processed.

- scolor:

  Row shading color.

- extra_packages:

  Extra LaTeX packages.

- document_class:

  Document class.

- caption:

  Table caption.

- label:

  Table label.

- align:

  Column alignment.

- longtable:

  Longtable setting.

- theme:

  Theme object or name.

## Value

A character string hash.
