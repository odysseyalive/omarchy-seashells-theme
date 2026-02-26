# Consultation Protocol

How agents query the ledger during `/awareness-ledger consult`.

## Triage Rules

Match tags from `ledger/index.md` against the current change context (file paths, component names, domain areas).

| Match Scope | Agents Spawned | Rationale |
|-------------|----------------|-----------|
| No records match | None | Zero overhead until records exist |
| Only incidents/flows match | Regression Hunter only | Single relevant perspective |
| Only decisions/patterns match | Skeptic only | Single relevant perspective |
| Risk/failure language detected | Premortem Analyst only | Targeted premortem |
| Multiple record types match | All three agents (full panel) | Cross-referencing needed |

## Synthesis Rules

After agents return findings:

- **Agreement** (2+ agents flag the same record/risk) = **HIGH confidence** warning
- **Disagreement** (agents flag different concerns) = **the signal** — investigate the disagreement itself, it reveals the most interesting risk
- **Single agent concern** = **MEDIUM confidence** consideration

## Consultation Briefing Format

```markdown
## Ledger Consultation

### Warnings (HIGH confidence — agents agree)
- **[Warning]** — [INC/DEC/PAT/FLW reference] — [one-line explanation]

### Considerations (agents disagree — investigate the disagreement)
- **[Topic]**
  - Regression Hunter: [finding]
  - Skeptic: [finding]
  - Premortem Analyst: [finding]

### Context (relevant records, no warnings)
- [ID] — [why it's relevant but not a warning]

### Capture Opportunity
The current conversation contains knowledge not yet in the ledger:
- **Suggested type:** [INC/DEC/PAT/FLW]
- **Suggested ID:** [auto-generated from context]
- **Source material:** [quote from conversation]
```
