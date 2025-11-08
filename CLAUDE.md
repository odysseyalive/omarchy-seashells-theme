# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SeaShells is a theme collection for Omarchy (an opinionated Linux distribution), providing ocean-inspired color schemes in both dark and light variants. The theme supports multiple applications across terminal emulators, editors, Wayland/Hyprland components, and system tools.

## Repository Structure

```
omarchy/themes/
├── seashells/           # Dark theme
│   ├── backgrounds/     # Background images (e.g., 1-chimney-rock.jpg)
│   └── [config files]   # Individual application theme files
└── seashells-light/     # Light theme
    ├── backgrounds/     # Background images (e.g., 1-rainbow-river.jpg)
    └── [config files]   # Individual application theme files
```

Each theme directory contains identical file types but with different color palettes.

## Theme Files

The repository contains configuration files for:
- Terminal emulators: `alacritty.toml`, `kitty.conf`, `ghostty.conf`
- Editors: `vscode.json`, `neovim.lua`
- Wayland/Hyprland: `hyprland.conf`, `hyprlock.conf`, `waybar.css`, `swayosd.css`
- System tools: `btop.theme`, `mako.ini`, `walker.css`, `chromium.theme`, `icons.theme`

## Key Color Palettes

**Dark Theme (seashells):**
- Background: `#08131a` (deep ocean)
- Foreground: `#deb88d` (warm sandy text)
- Accent: `#50a3b5` (bright cyan)
- Cursor: `#fba02f` (orange)

**Light Theme (seashells-light):**
- Background: `#fef9f2` (soft cream)
- Foreground: `#2d3339` (dark text)
- Accent: `#50a3b5` (ocean cyan - shared with dark)

## Installation

The `setup` script is the primary installation mechanism:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/odysseyalive/omarchy-seashells-theme/main/setup)"
```

This script:
1. Creates `~/.config/omarchy/themes/` directory
2. Downloads all theme files for both variants from the GitHub repository
3. Downloads background images for each theme
4. Uses cache-busting query parameters (`?cache_bust=$(date +%s)`) to avoid CDN caching issues

The script downloads from: `https://raw.githubusercontent.com/odysseyalive/omarchy-seashells-theme/main`

## Configuration Format Patterns

- **TOML**: Alacritty config uses nested TOML tables (`[colors.primary]`, `[colors.normal]`, `[colors.bright]`)
- **JSON**: VS Code uses `workbench.colorCustomizations` with editor, terminal, and UI color overrides
- **Lua**: Neovim config references the `kitty-themes.nvim` plugin and sets colorscheme to "SeaShells"
- **CSS**: Waybar, Walker, and SwayOSD use standard CSS styling
- **Conf files**: Hyprland configs use variable syntax (`$activeBorderColor`) and rgba colors with gradients

## Important Notes

- Both theme variants maintain the same file structure and naming conventions
- The cyan accent color (`#50a3b5`) is consistent across both light and dark themes
- Neovim integration depends on the `odysseyalive/kitty-themes.nvim` plugin
- Background images are stored in each theme's `backgrounds/` subdirectory with descriptive names
