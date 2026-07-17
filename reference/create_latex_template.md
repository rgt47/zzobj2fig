# Create LaTeX document template with specified packages

Create LaTeX document template with specified packages

## Usage

``` r
create_latex_template(
  document_class = "article",
  extra_packages = NULL,
  longtable = FALSE
)
```

## Arguments

- document_class:

  LaTeX document class

- extra_packages:

  List of package specifications or character strings

- longtable:

  Logical. Include longtable package if TRUE.

## Value

Character string with complete LaTeX document preamble
