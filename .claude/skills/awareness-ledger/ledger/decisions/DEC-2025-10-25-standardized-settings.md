# DEC-2025-10-25-standardized-settings

**Status:** accepted
**Tags:** compatibility, omarchy, chromium.theme, ghostty.conf, hyprlock.conf, swayosd.css, vscode.json, both-themes
**Related:** INC-2025-10-24-menu-transparency

## Context

Theme config files contained excessive custom settings that conflicted with Omarchy's base configuration. Files across both dark and light themes needed to be stripped down to only theme-relevant settings.

## Decision Drivers

- Omarchy manages its own base configuration for each app
- Theme files should only override color-related settings
- Extra settings in theme files caused conflicts and unexpected behavior

## Options Considered

### Option A: Full config files

- Good, because themes are self-contained
- Bad, because they conflict with Omarchy's base settings and break on Omarchy updates

### Option B: Minimal color-only overrides

- Good, because they compose cleanly with Omarchy's base configs
- Bad, because themes depend on Omarchy's base settings being correct

## Decision

Chosen option: **Option B — Minimal color-only overrides**, because themes must be compatible with Omarchy's evolving base configuration.

> **"Standardized theme settings for compatibility with Omarchy — themes should only contain color overrides, not full application configs"**

*— Captured 2026-02-26, source: git history (42610ca)*

## Consequences

- Removed 322 lines across 10 files (5 per theme variant)
- Themes now compose cleanly with any Omarchy version
- chromium.theme, ghostty.conf, hyprlock.conf, swayosd.css, vscode.json all simplified

## Confirmation Criteria

If Omarchy changes its base config and SeaShells themes still work without modification, this decision was correct.
