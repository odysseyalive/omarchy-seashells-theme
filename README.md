# SeaShells Theme for Omarchy

A beautiful, warm color theme collection for [Omarchy](https://omarchy.org) - the modern, opinionated Linux distribution by 37signals.

## Overview

SeaShells is a carefully crafted color scheme featuring warm ocean-inspired tones with excellent readability. This repository provides theme configurations for all major applications and tools used in Omarchy, available in both dark and light variants.

**Dark Theme Colors:**
- Deep ocean backgrounds (`#08131a`)
- Warm sandy text (`#deb88d`)
- Bright cyan accents (`#50a3b5`)

**Light Theme Colors:**
- Soft cream backgrounds (`#fef9f2`)
- Dark text (`#2d3339`)
- Ocean cyan accents (`#50a3b5`)

## Supported Applications

- **Terminal Emulators:** Alacritty, Kitty, Ghostty
- **Editors:** VS Code, Neovim/LazyVim
- **Wayland/Hyprland:** Hyprland compositor, Hyprlock, Waybar, SwayOSD
- **System Tools:** btop, Mako notifications, Walker launcher
- **Browsers:** Chromium/Chrome

## Installation

Install both theme variants with a single command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/odysseyalive/omarchy-seashells-theme/main/setup)"
```

This will install the themes to `~/.config/omarchy/themes/` with both variants:
- `seashells` (dark theme)
- `seashells-light` (light theme)

## Usage

After installation, copy or symlink the relevant theme files to your application config directories. For example:

```bash
# Kitty terminal
ln -sf ~/.config/omarchy/themes/seashells/kitty.conf ~/.config/kitty/themes/seashells.conf

# Alacritty
ln -sf ~/.config/omarchy/themes/seashells/alacritty.toml ~/.config/alacritty/seashells.toml

# Waybar
ln -sf ~/.config/omarchy/themes/seashells/waybar.css ~/.config/waybar/seashells.css
```

Refer to each application's documentation for specific instructions on loading theme files.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

## Credits

Based on the SeaShells colorscheme from [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes).
