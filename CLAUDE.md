# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains the SeaShells color theme configurations for various applications and tools, organized under the `omarchy/themes/` directory. There are two variants:
- `seashells`: Dark theme variant
- `seashells-light`: Light theme variant

## Architecture

### Directory Structure

```
omarchy/themes/
├── seashells/           # Dark theme variant
│   ├── alacritty.toml   # Terminal emulator
│   ├── kitty.conf       # Terminal emulator
│   ├── ghostty.conf     # Terminal emulator
│   ├── vscode.json      # VS Code color customizations
│   ├── neovim.lua       # Neovim/LazyVim configuration
│   ├── hyprland.conf    # Hyprland compositor
│   ├── hyprlock.conf    # Hyprland lock screen
│   ├── waybar.css       # Waybar status bar
│   ├── walker.css       # Walker application launcher
│   ├── mako.ini         # Notification daemon
│   ├── swayosd.css      # On-screen display
│   ├── btop.theme       # System monitor
│   ├── chromium.theme   # Browser theme
│   ├── icons.theme      # Icon theme definitions
│   └── backgrounds/     # Background images (currently empty)
└── seashells-light/     # Light theme variant (same structure)
```

### Color Palette

Each theme file defines colors for its specific application using the SeaShells palette:

**Dark Theme (seashells)**
- Background: `#08131a`
- Foreground: `#deb88d`
- Primary accent: `#50a3b5` (cyan)
- Secondary accent: `#fba02f` (orange/yellow)
- Selection: `#1e4862`

**Light Theme (seashells-light)**
- Background: `#fef9f2`
- Foreground: `#2d3339`
- Primary accent: `#50a3b5` (cyan)
- Secondary accent: `#d05023` (red/orange)
- Selection: `#e6f3fa`

## File Format Conventions

### Terminal Configurations
- **Alacritty**: Uses TOML format with `[colors.primary]`, `[colors.normal]`, `[colors.bright]` sections
- **Kitty**: Uses plain conf format with color names and hex values (e.g., `background #08131a`)
- **Ghostty**: Similar format to Kitty

### Editor Configurations
- **VS Code**: JSON format using `workbench.colorCustomizations` object
- **Neovim**: Lua format that returns a LazyVim plugin configuration table

### Wayland/Hyprland Configurations
- **Hyprland**: Uses Hyprland-specific conf syntax with variables (e.g., `$activeBorderColor`)
- **Waybar**: CSS format using `@define-color` directives
- **Mako**: INI format
- **Walker**: CSS format

## Adding New Theme Files

When adding support for a new application:

1. Create the configuration file in both `omarchy/themes/seashells/` and `omarchy/themes/seashells-light/`
2. Use the application-specific configuration format
3. Map the SeaShells color palette to the application's color scheme
4. Maintain consistency with existing theme files (use the same hex values for equivalent colors)
5. Include appropriate comments or metadata (author, upstream references) where the format allows

## Modifying Colors

When updating the color palette:

1. Colors are hardcoded in each theme file - there is no central color definition
2. To change a color across all applications, update each theme file individually
3. Ensure changes are applied to both dark and light variants
4. Test the theme in the target application to verify correct rendering

## License

This repository is licensed under the Apache License, Version 2.0. See LICENSE file for details.
