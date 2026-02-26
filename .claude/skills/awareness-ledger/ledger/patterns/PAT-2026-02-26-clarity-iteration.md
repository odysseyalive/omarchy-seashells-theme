# PAT-2026-02-26-clarity-iteration

**Status:** active
**Tags:** seashells-light, color-tuning, alacritty.toml, btop.theme, kitty.conf, walker.css, waybar.css
**Related:** INC-2025-11-08-kitty-tab-foreground, INC-2025-12-24-lazyvim-tab-bar

## Pattern

Light theme color values require multiple rounds of iteration to achieve good readability and visual clarity. Five consecutive commits (8aba85b through 417ad8d) were needed to tune the seashells-light color palette across 10 config files.

## Evidence

1. **5 consecutive clarity-related commits** — 8aba85b, 9d93c94, 4e56422, f6c0e5d, 417ad8d
2. **10 files affected** — alacritty.toml, btop.theme, chromium.theme, hyprland.conf, hyprlock.conf, kitty.conf, mako.ini, swayosd.css, walker.css, waybar.css
3. **Kitty tab foreground incident** — Similar readability issue in dark theme (INC-2025-11-08)

## Counter-Evidence

1. **Dark theme was mostly right first time** — The seashells dark theme didn't require the same iteration cycle

## Applicability

- **When to use:** When creating or modifying light theme color values, expect to iterate. Test each value in its actual context, not just in isolation.
- **When NOT to use:** Dark theme colors tend to need less iteration (higher contrast is more forgiving).

## Confidence

HIGH — Based on 5 consecutive commits all fixing the same category of issue across multiple files.
