# INC-2026-04-16-light-kitty-tab-placement

**Status:** resolved
**Tags:** kitty.conf, seashells-light, tab-bar, border, color-placement, readability
**Related:** INC-2025-11-08-kitty-tab-foreground, PAT-2026-02-26-clarity-iteration, PAT-2026-02-26-shared-accent-color

## What Happened

User reported that the seashells-light theme had readability issues — "color
placements are off, making some things hard to read." Review of the light
theme files found that `omarchy/themes/seashells-light/kitty.conf` had drifted
off-palette in four tab and border roles, while every other file in the light
theme was internally consistent with `colors.toml`.

Specifically, the inactive tab background (`#f0f4f7`) was only ~1.1:1 contrast
against the main background (`#e0d6c8`), making inactive tabs nearly invisible.
The inactive tab foreground (`#5a6b75`) and inactive border (`#e0e8ed`) were
similarly off-palette and poorly separated from their surroundings. The active
tab foreground was a non-palette pure white (`#ffffff`).

## Timeline

| Time/Commit | Event |
|-------------|-------|
| 417ad8d (earlier) | Last clarity-iteration commit touching light kitty.conf; off-palette values remained |
| 2026-04-16 | User reported readability issue |
| 2026-04-16 | Cataloged all light-theme color roles; localized drift to kitty.conf (4 values) |
| 2026-04-16 | Swapped 4 values to palette slots: `active_tab_foreground` #ffffff→#e0d6c8; `inactive_tab_background` #f0f4f7→#b8a796 (color0); `inactive_tab_foreground` #5a6b75→#0f2838 (color7/fg); `inactive_border_color` #e0e8ed→#b8a796 (color0) |

## Root Cause

Four tab/border roles in `seashells-light/kitty.conf` used hand-picked
non-palette hex values (`#ffffff`, `#f0f4f7`, `#5a6b75`, `#e0e8ed`) rather
than slots from the 18-color canonical palette. The cool near-whites
(`#f0f4f7`, `#e0e8ed`) specifically failed against the warm sand background
`#e0d6c8` — "inactive" ended up visually *lighter* than the canvas, so
inactive tabs and borders disappeared instead of receding.

## Contributing Factors (Swiss Cheese Layers)

1. **Iterative tuning without palette grounding** — Per
   PAT-2026-02-26-clarity-iteration, the light theme went through five
   clarity commits. Intermediate tunes introduced off-palette values that
   persisted because they "looked better than the previous round" in
   isolation, not because they matched the palette.
2. **Cool near-whites on warm bg** — The inactive values drifted toward a
   cool gray-blue family (`#f0f4f7`, `#e0e8ed`) that fights the warm sand
   identity and happens to be lighter than `#e0d6c8`, producing the
   "invisible inactive surface" failure mode specific to light themes.
3. **No automated contrast check against main bg** — Standard WCAG tooling
   checks foreground-on-background contrast but not the equally important
   "inactive surface must be visibly distinct from canvas" invariant.

## Resolution

Four single-value edits in `omarchy/themes/seashells-light/kitty.conf`:

| Role | Before | After | Palette slot |
|------|--------|-------|--------------|
| `active_tab_foreground` | `#ffffff` | `#e0d6c8` | main background (warm tie-back) |
| `inactive_tab_background` | `#f0f4f7` | `#b8a796` | `color0` |
| `inactive_tab_foreground` | `#5a6b75` | `#0f2838` | foreground / `color7` |
| `inactive_border_color` | `#e0e8ed` | `#b8a796` | `color0` |

The resolution mirrors the dark-theme structure where
`inactive_border_color == inactive_tab_background == color0`, giving both
themes the same role-to-slot mapping.

## Lessons Learned

> **"Inactive surfaces in a light theme must be visibly *darker* than the
> main background, not lighter. A near-white inactive value on a warm-sand
> canvas disappears instead of receding. Always use `color0` (the palette's
> darker neutral) for inactive chrome, and keep the tonal family warm."**

*— Captured 2026-04-16, source: conversation with user reporting the issue.*

Corollary, reaffirming INC-2025-11-08's lesson: for tab foreground text,
reuse the main foreground value rather than inventing a mid-gray.

## Prevention

- **Invariant to enforce:** Every UI color in an override file should map
  to a slot in `colors.toml` (or be documented as a deliberate exception
  in `reference.md`'s Override Rationale table).
- **Quick audit check:** Grep each override file for hex values not present
  in `colors.toml`; any orphans need explicit justification.
- Link to PAT-2026-02-26-clarity-iteration: light-theme tuning should
  terminate when every value is either in the palette or in the override
  rationale — not when it "looks okay."
