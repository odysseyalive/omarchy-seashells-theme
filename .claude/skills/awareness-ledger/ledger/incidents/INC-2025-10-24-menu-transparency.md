# INC-2025-10-24-menu-transparency

**Status:** resolved
**Tags:** walker.css, transparency, menu, both-themes
**Related:** DEC-2025-10-25-standardized-settings

## What Happened

Walker application launcher menu had transparency issues affecting usability in both dark and light theme variants.

## Timeline

| Time/Commit | Event |
|-------------|-------|
| 170e93a | Simplified walker.css in both themes (reduced from ~37 to ~12 lines per theme) |

## Root Cause

Overly complex CSS styling in walker.css created unpredictable transparency behavior.

## Resolution

Simplified walker.css significantly, reducing complexity and fixing transparency rendering.

## Lessons Learned

> **"Simpler CSS is more reliable — when fixing transparency issues, simplify the stylesheet rather than adding more overrides"**

*— Captured 2026-02-26, source: git history (170e93a)*

## Prevention

Keep walker.css minimal. Only include essential color and layout properties.
