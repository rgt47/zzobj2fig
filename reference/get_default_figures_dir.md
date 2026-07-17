# Detect default figures directory

Returns "analysis/figures" for zzcollab projects, "figures" otherwise.
Detects zzcollab by presence of .zzcollab/ directory or zzcollab.yaml
file.

## Usage

``` r
get_default_figures_dir()
```

## Value

Character string with default figures directory path.
