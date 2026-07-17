# Numeric Alignment for the Typst Backend

Typst approximation of `siunitx`'s decimal-aligned columns via the
`metro` community package (<https://typst.app/universe/package/metro>).
Emits a Typst import directive and a `zzo2f_siunitx` spec that can be
recognized downstream for column-level number formatting.

## Details

`metro` supports `#qty` and `#num` functions that format numeric values
with unit-aware spacing and padded decimal alignment. It does **not**
cover every `siunitx` option; notable gaps include per-row rounding
modes beyond `places` / `figures`, bracket/parenthesis wrapping of
uncertainties, and the full range of `round-mode` behaviors.
