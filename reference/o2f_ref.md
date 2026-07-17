# Generate LaTeX for referencing a table

Generate cross-reference commands for o2f tables.

## Usage

``` r
o2f_ref(label, type = c("ref", "autoref", "pageref", "nameref"), cat = TRUE)
```

## Arguments

- label:

  The label to reference.

- type:

  Reference type: "ref", "autoref", "pageref", "nameref".

- cat:

  Logical. If TRUE (default), prints via cat().

## Value

LaTeX code (invisibly if cat=TRUE).

## Examples

``` r
if (FALSE) { # \dontrun{
o2f_ref("fig:results")           # \ref{fig:results}
o2f_ref("fig:results", "autoref") # \autoref{fig:results}
} # }
```
