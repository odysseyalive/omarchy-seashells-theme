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

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/odysseyalive/omarchy-seashells-theme/main/setup)"
```

Downloads from: `https://raw.githubusercontent.com/odysseyalive/omarchy-seashells-theme/main`

## Skills Reference

| Skill | Purpose |
|-------|---------|
| `/seashells-theme` | Color palettes, config format patterns, consistency rules |
| `/awareness-ledger` | Institutional memory — incidents, decisions, patterns |

## Important Rules

- Both theme variants maintain the same file structure and naming conventions
- The cyan accent color (`#50a3b5`) is consistent across both light and dark themes
- Themes must only contain color overrides, not full app configs (Omarchy compatibility)
- Neovim integration depends on the `odysseyalive/kitty-themes.nvim` plugin

## Project Memory

This project uses an awareness ledger for institutional memory.

**Before recommending changes:** During research and planning, check
`.claude/skills/awareness-ledger/ledger/index.md` for relevant records. If
matching records exist, read them and factor their warnings, decisions, and
patterns into your recommendation. Use `/awareness-ledger consult` for full
agent-assisted analysis when high-risk overlap is detected.

**After resolving issues:** When you encounter bug investigations with root
causes, architectural decisions with trade-offs, or recurring patterns, ask
the user if they want to record the knowledge in the awareness ledger. Use
`/awareness-ledger record [type]` to capture it. Always finish the immediate
work first — suggest capture after, not during.
