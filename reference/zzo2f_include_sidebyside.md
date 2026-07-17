# Include two rendered tables side by side

Include two rendered tables side by side

## Usage

``` r
zzo2f_include_sidebyside(
  path1,
  path2,
  caption1 = NULL,
  caption2 = NULL,
  label1 = NULL,
  label2 = NULL,
  width1 = "0.48\\textwidth",
  width2 = "0.48\\textwidth",
  position = NULL,
  main_caption = NULL,
  main_label = NULL,
  cat = TRUE
)
```

## Arguments

- path1:

  First image path.

- path2:

  Second image path.

- caption1:

  Caption for the first figure.

- caption2:

  Caption for the second figure.

- label1:

  Label for the first figure.

- label2:

  Label for the second figure.

- width1:

  Width of the first column (translated).

- width2:

  Width of the second column (translated).

- position:

  Ignored; retained for API symmetry.

- main_caption:

  Outer caption around the grid.

- main_label:

  Outer label.

- cat:

  Logical.

## Value

Character; printed when `cat = TRUE`.
