# Page directive for Typst (parallel to `geometry()`)

Page directive for Typst (parallel to
[`geometry()`](https://rgt47.github.io/zzobj2fig/reference/geometry.md))

## Usage

``` r
zzo2f_page(
  margin = NULL,
  paper = NULL,
  landscape = FALSE,
  width = NULL,
  height = NULL
)
```

## Arguments

- margin:

  Character or NULL. A Typst length (`"2cm"`) or a named list like
  `list(x = "2cm", y = "1.5cm")` for horizontal / vertical margins, or
  `list(top = ..., bottom = ..., left = ..., right = ...)` for a full
  specification.

- paper:

  Character or NULL. Typst paper code (e.g. `"a4"`, `"us-letter"`).

- landscape:

  Logical. Emit `flipped: true`.

- width:

  Character or NULL. Typst length, e.g. `"auto"`.

- height:

  Character or NULL.

## Value

Character scalar Typst `#set page(...)` directive.
