---
name: seashells-theme
description: "SeaShells theme palettes, format patterns, consistency rules, and update diagnostics. Modes: default (reference), update (migration diagnostic), list (show modes)"
allowed-tools: Read, Glob, Grep, Edit, Write, Bash
---

# SeaShells Theme

Ocean-inspired color palettes for Omarchy. Dark and light variants with shared accent identity.

---

## Usage

| Mode | Invocation | Purpose |
|------|-----------|---------|
| default | `/seashells-theme` | Load color palettes, format patterns, and consistency rules |
| update | `/seashells-theme update` | Run Omarchy migration diagnostic — classify files, check keys, detect drift |
| list | `/seashells-theme list` | Display this Modes table |

---

## Workflow: Update

When invoked with `update`, run this 8-step diagnostic:

1. **Omarchy version** — read `~/.local/share/omarchy/version`
2. **Scan templates** — list all `.tpl` files in `~/.local/share/omarchy/default/themed/`
3. **Read theme inventory** — list files in both `omarchy/themes/seashells/` and `seashells-light/`
4. **Classify files** — for each file, read the Override Rationale and Non-templatable tables in `reference.md`:
   - **Override** — file has a `.tpl` template but we ship a hand-tuned version (rationale documented)
   - **Auto-generated** — `.tpl` exists and we do NOT ship the file (template system handles it)
   - **Non-templatable** — no `.tpl` exists; file is inherently non-templatable (rationale documented)
   - **NEW template** — a `.tpl` exists but the file is not classified in reference.md (needs triage)
5. **Check `colors.toml` completeness** — extract `{{ key }}` / `{{ key_strip }}` / `{{ key_rgb }}` placeholders from all `.tpl` files; verify every base key exists in both `colors.toml` files
6. **Check `setup` script** — verify `THEME_FILES` array matches actual theme file inventory
7. **Check `reference.md`** — verify Theme Files tables match actual inventory
8. **Produce report** with sections: File Classification, New Templates, Missing Keys, Drift, Recommended Actions

## Workflow: List

When invoked with `list`, output the Modes table from the Usage section above.

---

## Color Consistency Rules

When editing theme files:

1. **Read the canonical palette** from `reference.md` before changing any color value
2. **Both themes must stay in sync** structurally — same files, same sections, same naming
3. **The accent color #50a3b5 is shared** between dark and light themes (PAT-2026-02-26-shared-accent-color)
4. **Use only color-override settings** — themes must not include full app configs (DEC-2025-10-25-standardized-settings)
5. **Verify contrast** for tab and UI element colors against their backgrounds (INC-2025-11-08-kitty-tab-foreground)
6. **Light theme colors require iteration** — expect multiple rounds of tuning (PAT-2026-02-26-clarity-iteration)

## Configuration Format Patterns

Each config file uses a specific format. Match the pattern when editing:

- **TOML** (colors.toml): Flat key-value — 18 base palette keys consumed by Omarchy template system
- **JSON** (vscode.json): `workbench.colorCustomizations` with editor, terminal, and UI color overrides
- **Lua** (neovim.lua): References `kitty-themes.nvim` plugin, sets colorscheme to "SeaShells", `transparent = true`
- **Conf** (hyprland.conf): Variable syntax `$activeBorderColor` with rgba colors and gradients
- **Conf** (hyprlock.conf): Key-value color definitions for lock screen
- **Conf** (kitty.conf, ghostty.conf): Key-value color definitions
- **INI** (btop.theme): Key-value with section headers, hand-tuned selection/gradient values

## Project Memory

Before recommending changes to files in this skill's domain, check
`.claude/skills/awareness-ledger/ledger/index.md` for relevant records.
If matching records exist, read them and incorporate their warnings,
decisions, and patterns into your plan. Use `/awareness-ledger consult`
for full agent-assisted analysis when high-risk overlap is detected.

After resolving issues that produce institutional knowledge (root causes,
architectural decisions, recurring patterns, user flows), ask the user
if they want to record it with `/awareness-ledger record [type]`.

---

## Grounding

Before using any color value or format pattern:
1. Read `reference.md`
2. State: "I will use [COLOR/PATTERN] from reference.md under [SECTION]"

See [reference.md](reference.md) for canonical color palettes.

## Self-Heal Observer

Throughout this session, quietly note any friction signals — corrections, reformulations,
clarifying questions, "actually" moments, or any subtle sign that this skill's instructions
may have led to a misrepresentation. Do not interrupt the session to address these.
Do not mention that you are observing.

At natural task resolution (when the task is complete and the user signals done),
if friction signals were noted, run the self-heal diagnosis protocol:

Read `.claude/skills/self-heal/references/diagnosis-protocol.md` and follow it exactly.

If no friction signals were noted, or if diagnosis finds no skill-caused issues,
end the session normally without mentioning self-heal.

The goal is efficiency: get it right permanently, rather than repeat the same
misrepresentation across future sessions.
