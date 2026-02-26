---
name: awareness-ledger
description: "Institutional memory for your project. Commands: record, consult, review. Usage: /awareness-ledger [command] [args]"
allowed-tools: Read, Glob, Grep, Write, Edit, Task, TaskCreate, TaskUpdate, TaskList, TaskGet
---

# Awareness Ledger

Institutional memory for SeaShells theme. Records incidents, decisions, patterns, and flows so diagnostic findings and architectural decisions persist across sessions.

## Quick Commands

| Command | Action |
|---------|--------|
| `/awareness-ledger record [type]` | Create a new record (INC, DEC, PAT, FLW) |
| `/awareness-ledger consult [topic]` | Query ledger with agent-assisted analysis |
| `/awareness-ledger review` | Health check: stale entries, statistics, tag drift |

---

## Directives

*(No directives yet — add with `/skill-builder inline awareness-ledger [directive]`)*

---

### Auto-Consultation (READ)

During research and planning — before formulating any plan, recommendation, or
code change proposal — automatically consult the ledger:

1. **Index scan** — Read `ledger/index.md` and match tags against the files,
   directories, and components under discussion. This is free — the index is
   small. Do this as part of your initial research, alongside reading source
   files.
2. **Record review** — If matching records exist, read the full record files.
   Incorporate warnings, known failure modes, and relevant decisions into your
   thinking before presenting any plan to the user. This is cheap — records
   are short.
3. **Agent escalation** — If high-risk overlap is detected (matching INC records
   with active status, or multiple record types matching the same change area),
   spawn consultation agents proportionally per the agent table in
   `references/consultation-protocol.md`. Present agent findings as part of
   your recommendation. This is expensive — only when warranted.

Skip auto-consultation for:
- Changes to `.claude/` infrastructure files
- Trivial edits (typos, formatting, comments)
- Areas with no tag overlap in the index

### Auto-Capture Suggestion (WRITE)

When the current conversation produces institutional knowledge, suggest recording it **after** resolving the immediate issue. Never interrupt active problem-solving to suggest capture.

Automatically suggest capture when you encounter:
- **Bug investigation** with timeline, root cause analysis, or contributing factors -> INC record
- **Architectural decisions** with trade-offs discussed and option chosen -> DEC record
- **Recurring patterns** observed across multiple instances or confirmed by evidence -> PAT record
- **User/system flows** traced step-by-step with code paths identified -> FLW record

Capture suggestions are always user-confirmed. Present the suggestion with:
- Suggested record type and ID
- Key content to capture (quoted from conversation)
- One-line confirmation prompt: "Record this in the awareness ledger? (confirm/skip)"

---

## Workflow: Record

1. Read `references/templates.md` for the record type template
2. Walk through the template fields with the user
3. Write the completed record to `ledger/[type]/[ID].md`
4. Update `ledger/index.md` with the new entry

## Workflow: Consult

1. Read `ledger/index.md` and match tags against the current context
2. Read matching records in full
3. Triage: determine which agents to spawn per `references/consultation-protocol.md`
4. Spawn agents proportionally (zero agents if no matches)
5. Synthesize findings into consultation briefing format
6. If conversation produced capturable knowledge, suggest recording

## Workflow: Review

1. Read all records, check for stale entries (resolved incidents still marked active, etc.)
2. Check tag consistency across records
3. Report statistics by type and status
4. Flag records that reference deleted files or outdated code paths

---

## Grounding

Before using any template or protocol:
1. Read the relevant file from `references/`
2. State: "I will use [TEMPLATE/PROTOCOL] from references/[file] under [SECTION]"

Reference files:
- [references/templates.md](references/templates.md) — Record type templates (INC, DEC, PAT, FLW)
- [references/consultation-protocol.md](references/consultation-protocol.md) — Agent triage and synthesis rules
- [references/capture-triggers.md](references/capture-triggers.md) — Conversation signals for capture

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
