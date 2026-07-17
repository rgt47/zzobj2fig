# Check LaTeX dependencies for zzobj2fig

Checks that all required LaTeX tools are available and provides
installation guidance if not.

## Usage

``` r
check_latex_deps(auto_install = TRUE)
```

## Arguments

- auto_install:

  Logical. Attempt to auto-install missing components via tinytex.
  Default is TRUE.

## Value

A list with availability status for each component (invisibly).

## Examples

``` r
if (FALSE) { # \dontrun{
check_latex_deps()
} # }
```
