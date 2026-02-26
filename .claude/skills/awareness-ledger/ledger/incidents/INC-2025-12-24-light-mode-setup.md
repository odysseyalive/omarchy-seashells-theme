# INC-2025-12-24-light-mode-setup

**Status:** resolved
**Tags:** setup, light.mode, seashells-light
**Related:** DEC-2025-10-25-standardized-settings

## What Happened

The `light.mode` marker file was being downloaded for both themes (seashells and seashells-light), when it should only exist for the light theme variant.

## Timeline

| Time/Commit | Event |
|-------------|-------|
| 179bb31 | Added light.mode to the general THEME_FILES array (downloaded for both themes) |
| ca09378 | Fixed by removing from THEME_FILES and adding conditional download only for seashells-light |

## Root Cause

Initially `light.mode` was added to the shared THEME_FILES array, causing it to be downloaded for the dark theme as well. The file is a marker that signals the theme is a light variant.

## Resolution

Moved `light.mode` download to a conditional block that only runs for the seashells-light theme.

## Lessons Learned

> **"Theme-variant-specific files (like light.mode marker) must not be in the shared THEME_FILES array — use conditional downloads instead"**

*— Captured 2026-02-26, source: git history (179bb31, ca09378)*

## Prevention

When adding theme-specific files, always check whether they apply to both variants or just one.
