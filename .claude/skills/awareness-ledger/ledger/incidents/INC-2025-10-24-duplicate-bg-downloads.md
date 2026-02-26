# INC-2025-10-24-duplicate-bg-downloads

**Status:** resolved
**Tags:** setup, background-images, download-loop
**Related:**

## What Happened

The setup script was downloading background images multiple times due to missing loop break statements.

## Timeline

| Time/Commit | Event |
|-------------|-------|
| 6601a12 | Added `break 2` after successful download to exit nested loops |

## Root Cause

The nested download loops in `download_backgrounds()` function lacked break statements, causing the script to continue iterating after a successful download.

## Resolution

Added `break 2` statements after successful downloads in both theme cases (seashells and seashells-light) to exit both loops immediately.

## Lessons Learned

> **"Nested download loops need explicit break statements to avoid re-downloading the same resource"**

*— Captured 2026-02-26, source: git history (6601a12)*

## Prevention

When modifying the setup script's download logic, verify loop termination conditions.
