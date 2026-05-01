# --- Theme creation ---

# o2f_theme creates valid theme object
theme <- o2f_theme(name = "test", scolor = "red!10")
expect_inherits(theme, "o2f_theme")
expect_equal(theme$name, "test")
expect_equal(theme$scolor, "red!10")

# built-in themes are accessible
expect_inherits(o2f_theme_minimal(), "o2f_theme")
expect_inherits(o2f_theme_apa(), "o2f_theme")
expect_inherits(o2f_theme_nature(), "o2f_theme")
expect_inherits(o2f_theme_nejm(), "o2f_theme")
expect_inherits(o2f_theme_lancet(), "o2f_theme")

# o2f_list_themes returns built-in themes
themes <- o2f_list_themes(builtin_only = TRUE)
expect_true("minimal" %in% themes)
expect_true("apa" %in% themes)
expect_true("nature" %in% themes)
expect_true("nejm" %in% themes)
expect_true("lancet" %in% themes)


# --- Theme set/get ---

# o2f_theme_set and o2f_theme_get work
old <- o2f_theme_set(NULL)
expect_null(o2f_theme_get())

o2f_theme_set("nejm")
current <- o2f_theme_get()
expect_inherits(current, "o2f_theme")
expect_equal(current$name, "nejm")
o2f_theme_set(old)


# --- Theme registration ---

# o2f_theme_register adds custom theme
jama <- o2f_theme(name = "jama", scolor = "white", striped = FALSE)
expect_message(o2f_theme_register(jama), "registered successfully")
expect_true("jama" %in% o2f_list_themes())
o2f_theme_clear()

# o2f_theme_register rejects non-theme objects
expect_error(
  o2f_theme_register(list(name = "fake")),
  "must be a o2f_theme object"
)

# o2f_theme_register prevents overwriting built-in themes
theme_nejm <- o2f_theme(name = "nejm")
expect_error(
  o2f_theme_register(theme_nejm),
  "Cannot register theme with built-in name"
)

# o2f_theme_register prevents duplicates without overwrite
theme1 <- o2f_theme(name = "custom1", scolor = "blue!10")
theme2 <- o2f_theme(name = "custom1", scolor = "red!10")
expect_message(o2f_theme_register(theme1), "registered successfully")
expect_error(o2f_theme_register(theme2), "already registered")
o2f_theme_clear()

# o2f_theme_register allows overwrite with flag
theme1 <- o2f_theme(name = "custom2", scolor = "blue!10")
theme2 <- o2f_theme(name = "custom2", scolor = "red!10")
o2f_theme_register(theme1)
expect_message(
  o2f_theme_register(theme2, overwrite = TRUE),
  "registered successfully"
)
retrieved <- zzobj2fig:::get_builtin_theme("custom2")
expect_equal(retrieved$scolor, "red!10")
o2f_theme_clear()

# o2f_theme_register accepts custom name
theme <- o2f_theme(name = "internal_name", scolor = "green!10")
expect_message(
  o2f_theme_register(theme, name = "external_name"),
  "'external_name' registered"
)
expect_true("external_name" %in% o2f_list_themes())
o2f_theme_clear()

# registered themes work with o2f_theme_set
jama2 <- o2f_theme(
  name = "jama", scolor = "gray!5", font_size = "small"
)
o2f_theme_register(jama2)
o2f_theme_set("jama")
current <- o2f_theme_get()
expect_equal(current$name, "jama")
expect_equal(current$font_size, "small")
o2f_theme_set(NULL)
o2f_theme_clear()


# --- Theme unregistration ---

# o2f_theme_unregister removes custom theme
theme <- o2f_theme(name = "temp_theme")
o2f_theme_register(theme)
expect_true("temp_theme" %in% o2f_list_themes())
expect_message(o2f_theme_unregister("temp_theme"), "unregistered")
expect_false("temp_theme" %in% o2f_list_themes())

# o2f_theme_unregister handles missing theme
expect_message(
  result <- o2f_theme_unregister("nonexistent"),
  "not found"
)
expect_false(result)


# --- Theme clear ---

# o2f_theme_clear removes all custom themes
o2f_theme_register(o2f_theme(name = "a"))
o2f_theme_register(o2f_theme(name = "b"))
o2f_theme_register(o2f_theme(name = "c"))
expect_message(n <- o2f_theme_clear(), "Cleared 3")
expect_equal(n, 3)
expect_equal(o2f_list_themes(), o2f_list_themes(builtin_only = TRUE))


# --- get_builtin_theme ---

# finds registered custom themes
bmj <- o2f_theme(name = "bmj", scolor = "white", header_bold = TRUE)
o2f_theme_register(bmj)
retrieved <- zzobj2fig:::get_builtin_theme("bmj")
expect_inherits(retrieved, "o2f_theme")
expect_equal(retrieved$name, "bmj")
o2f_theme_clear()

# errors for unknown theme
expect_error(
  zzobj2fig:::get_builtin_theme("unknown_theme"),
  "Unknown theme"
)


# --- o2f_list_themes with custom ---

o2f_theme_register(o2f_theme(name = "custom_journal"))
all_themes <- o2f_list_themes()
builtin_themes <- o2f_list_themes(builtin_only = TRUE)
expect_true("custom_journal" %in% all_themes)
expect_false("custom_journal" %in% builtin_themes)
o2f_theme_clear()


# --- print.o2f_theme ---

theme <- o2f_theme_nejm()
output <- capture.output(print(theme))
expect_true(any(grepl("nejm", output)))
expect_true(any(grepl("Row shading", output)))
