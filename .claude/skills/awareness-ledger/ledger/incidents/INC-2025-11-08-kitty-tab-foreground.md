# INC-2025-11-08-kitty-tab-foreground

**Status:** resolved
**Tags:** kitty.conf, tab-bar, foreground-color, readability
**Related:** PAT-2026-02-26-clarity-iteration

## What Happened

Kitty terminal inactive tab text was unreadable. The inactive tab foreground color was too dark (#424b52) against the dark background (#0f2838).

## Timeline

| Time/Commit | Event |
|-------------|-------|
| bc599ef | Changed inactive_tab_foreground from #424b52 to #deb88d |

## Root Cause

The inactive tab foreground color (#424b52) had insufficient contrast against the inactive tab background (#0f2838), making tabs hard to read.

## Resolution

Changed inactive_tab_foreground to match the main foreground color (#deb88d), ensuring consistent readability.

## Lessons Learned

> **"Tab and UI element foreground colors need sufficient contrast — reuse the main foreground color rather than inventing low-contrast variants"**

*— Captured 2026-02-26, source: git history (bc599ef)*

## Prevention

When setting tab/UI element colors, verify contrast ratio against background. Default to using the main foreground color for text readability.
