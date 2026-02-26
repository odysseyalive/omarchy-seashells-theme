# INC-2025-12-24-lazyvim-tab-bar

**Status:** resolved
**Tags:** neovim.lua, kitty-themes, transparent, LazyVim
**Related:** PAT-2026-02-26-clarity-iteration

## What Happened

LazyVim tab bar was not rendering correctly with the SeaShells theme. The tab bar needed transparency enabled to work properly with the Omarchy desktop.

## Timeline

| Time/Commit | Event |
|-------------|-------|
| 9f90d20 | Changed `transparent = false` to `transparent = true` in neovim.lua |

## Root Cause

The kitty-themes.nvim plugin configuration had `transparent = false`, which conflicted with how LazyVim renders the tab bar in a transparent terminal environment.

## Resolution

Set `transparent = true` in the kitty-themes.nvim setup configuration.

## Lessons Learned

> **"Neovim theme transparency must be true for compatibility with Omarchy's transparent terminal setup"**

*— Captured 2026-02-26, source: git history (9f90d20)*

## Prevention

Ensure all new neovim theme configurations default to `transparent = true`.
