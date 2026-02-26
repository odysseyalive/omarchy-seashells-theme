# SeaShells Theme Reference
<!-- Enforcement: HIGH — canonical color values for all theme files -->

## Dark Theme (seashells) — Canonical Palette

### Primary
| Role | Hex | Description |
|------|-----|-------------|
| Background | `#08131a` | Deep ocean |
| Foreground | `#deb88d` | Warm sandy text |
| Selection BG | `#1e4862` | Deep blue selection |

### Normal Colors
| Name | Hex |
|------|-----|
| Black | `#0f2838` |
| Red | `#d05023` |
| Green | `#027b9b` |
| Yellow | `#fba02f` |
| Blue | `#2d6870` |
| Magenta | `#68d3f0` |
| Cyan | `#50a3b5` |
| White | `#deb88d` |

### Bright Colors
| Name | Hex |
|------|-----|
| Black | `#424b52` |
| Red | `#d38677` |
| Green | `#618c98` |
| Yellow | `#fdd29e` |
| Blue | `#1abcdd` |
| Magenta | `#bbe3ee` |
| Cyan | `#86abb3` |
| White | `#fee3cd` |

### UI Elements
| Role | Hex | Used In |
|------|-----|---------|
| Cursor | `#fba02f` | kitty, ghostty |
| Active tab BG | `#2d6870` | kitty |
| Active tab FG | `#deb88d` | kitty |
| Inactive tab BG | `#0f2838` | kitty |
| Inactive tab FG | `#deb88d` | kitty |
| Active border | `#50a3b5` | kitty, hyprland |

---

## Light Theme (seashells-light) — Canonical Palette

### Primary
| Role | Hex | Description |
|------|-----|-------------|
| Background | `#e0d6c8` | Warm sand |
| Foreground | `#0f2838` | Deep navy text |
| Selection BG | `#c8dde8` | Light blue selection |

### Normal Colors
| Name | Hex |
|------|-----|
| Black | `#b8a796` |
| Red | `#d05023` |
| Green | `#027b9b` |
| Yellow | `#d88821` |
| Blue | `#2d6870` |
| Magenta | `#0f7b8a` |
| Cyan | `#50a3b5` |
| White | `#0f2838` |

### Bright Colors
| Name | Hex |
|------|-----|
| Black | `#4a5a65` |
| Red | `#d38677` |
| Green | `#618c98` |
| Yellow | `#c57a1a` |
| Blue | `#0e8fb5` |
| Magenta | `#2d6870` |
| Cyan | `#3a6a75` |
| White | `#08131a` |

---

## Shared Colors (same in both themes)

| Role | Hex | Significance |
|------|-----|-------------|
| Accent/Cyan | `#50a3b5` | SeaShells identity color — DO NOT diverge |
| Red | `#d05023` | Error/danger — same in both |
| Green | `#027b9b` | Success/info — same in both |
| Blue | `#2d6870` | Active elements — same in both |
| Bright Red | `#d38677` | Soft red — same in both |
| Bright Green | `#618c98` | Muted teal — same in both |

---

## Theme Files

Both `omarchy/themes/seashells/` and `omarchy/themes/seashells-light/` contain:

| File | Format | Scope | Type |
|------|--------|-------|------|
| `btop.theme` | INI | System monitor colors | Override |
| `colors.toml` | TOML | 18-value palette for template system | Template source |
| `ghostty.conf` | Conf | Terminal colors | Override |
| `hyprland.conf` | Conf | Window borders, gaps | Override |
| `hyprlock.conf` | Conf | Lock screen colors | Override |
| `icons.theme` | INI | Icon theme pointer | Non-templatable |
| `kitty.conf` | Conf | Terminal colors + tabs | Override |
| `neovim.lua` | Lua | Editor colorscheme | Non-templatable |
| `preview.png` | PNG | Theme preview image | Image |
| `vscode.json` | JSON | Editor color overrides | Non-templatable |

Light theme additionally has: `light.mode` (marker file — downloaded only for seashells-light)

### Auto-generated from `colors.toml` templates (not shipped in repo)

| File | Scope |
|------|-------|
| `alacritty.toml` | Terminal colors (search, vi_mode, footer_bar) |
| `chromium.theme` | Browser theme |
| `keyboard.rgb` | Keyboard RGB lighting |
| `mako.ini` | Notification colors |
| `obsidian.css` | Obsidian note-taking app |
| `hyprland-preview-share-picker.css` | Hyprland share picker |
| `swayosd.css` | OSD overlay colors |
| `walker.css` | App launcher colors |
| `waybar.css` | Status bar colors |

---

## Omarchy Template System

Omarchy auto-generates app configs from templates using `colors.toml` values.

- **Template location:** `~/.local/share/omarchy/default/themed/*.tpl`
- **Palette source:** `colors.toml` — 18 base keys (accent, cursor, foreground, background, selection_foreground, selection_background, color0–color15)
- **Placeholder variants:**
  - `{{ key }}` — hex value as-is (e.g., `#50a3b5`)
  - `{{ key_strip }}` — hex without `#` prefix (e.g., `50a3b5`)
  - `{{ key_rgb }}` — decimal RGB tuple (e.g., `80, 163, 181`)

Files with a matching `.tpl` template are auto-generated at theme-switch time.
Override files in the repo replace the auto-generated version — they are installed
by the `setup` script and take precedence because they exist before the template runs.

---

## Override Rationale

Why each override file is kept instead of relying on its template:

| File | Why override is needed |
|------|----------------------|
| `kitty.conf` | Template lacks `url_color`, custom tab styling, `inactive_border_color`. Uses `#2d6870` for active tab BG (not accent). |
| `ghostty.conf` | Uses Ghostty's theme registry (`theme = SeaShells`); template generates redundant full palette. |
| `btop.theme` | Hand-tuned values: custom `selected_bg`/`selected_fg`, uniform box outlines, simplified gradients. |
| `hyprland.conf` | Uses `rgba()` with alpha + dual-color gradient. Template uses `rgb()` with no alpha/gradient. |
| `hyprlock.conf` | Maps `outer_color` to accent (not foreground). Light uses non-palette background value. |

---

## Non-templatable Files

Files that can never be template-generated:

| File | Why non-templatable |
|------|-------------------|
| `neovim.lua` | Loads colorscheme via `kitty-themes.nvim` plugin; no template exists or could exist |
| `vscode.json` | VS Code uses its own extension-based theme system; no Omarchy template |
| `icons.theme` | Points to an icon theme by name; no color values to template |
| `preview.png` | Binary screenshot image; not a config file |
| `light.mode` | Marker file (seashells-light only); presence signals light mode to Omarchy |

---
*Canonical palette source for SeaShells theme. All color values in config files should match these tables.*
