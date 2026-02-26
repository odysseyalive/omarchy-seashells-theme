# PAT-2026-02-26-shared-accent-color

**Status:** active
**Tags:** accent-color, #50a3b5, both-themes, color-palette
**Related:** DEC-2025-10-25-standardized-settings

## Pattern

The ocean cyan accent color (#50a3b5) is deliberately shared between dark and light theme variants. This creates visual continuity when switching between themes and anchors the "SeaShells" identity.

## Evidence

1. **CLAUDE.md explicitly documents shared accent** — "Accent: #50a3b5 (ocean cyan - shared with dark)"
2. **Both alacritty.toml files use identical bright cyan** — The bright color palette shares values across variants
3. **Hyprland border colors reference the same accent** — Used for active borders in both themes

## Counter-Evidence

1. **Some colors DO differ between themes** — Background, foreground, and cursor colors are theme-specific (this pattern only applies to accent/cyan)

## Applicability

- **When to use:** When updating accent colors or adding new accent-colored UI elements, ensure both themes use the same #50a3b5 value.
- **When NOT to use:** Background, foreground, cursor, and selection colors are expected to differ between themes.

## Confidence

HIGH — Explicitly documented design decision, consistently applied across all config files.
