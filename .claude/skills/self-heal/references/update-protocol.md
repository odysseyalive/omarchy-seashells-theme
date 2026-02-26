# Update Protocol

How to construct the before/after diff and apply approved changes.

## Diff Construction Rules

The before/after diff must be:

1. **Exact** — Quote the current instruction verbatim, character for character
2. **Scoped** — Show only the changed portion, plus one sentence of context on each side
3. **Honest** — If the proposed change is more than a sentence, reconsider minimality
4. **Readable** — Plain text diff. No code diff syntax. User is approving natural language changes.

**Good diff (surgical):**

```
Current:
"Read the file and identify any issues."

Proposed:
"Read the file and identify syntax errors, missing imports, and undefined variables.
Do not flag style issues unless the user asks."
```

**Bad diff (too broad):**

```
Current:
[entire workflow section, 8 lines]

Proposed:
[rewritten workflow section, 8 lines]
```

If the diff requires showing more than 3-4 lines of change, the patch is not surgical enough.

## Approval Language

The proposal must:
- Identify what went wrong in plain language
- Show the diff clearly labeled "Current" and "Proposed"
- End with a simple yes/no question
- Not oversell or express uncertainty

The proposal must NOT:
- Use system language ("PATCH APPROVED", "DIAGNOSIS RESULT")
- Apologize excessively
- Explain the entire diagnostic process
- Add caveats that undermine the proposal

## Application Rules

When applying an approved change:
1. Read the current SKILL.md fresh
2. Locate the exact string from the "Current" portion
3. Replace with the "Proposed" text — nothing else
4. Verify the change was applied correctly
5. Report confirmation in one sentence
6. Append a record to the target skill's `self-heal-history.md`

If the exact string cannot be located:
- Report: "The skill file seems to have changed since I proposed this update. Would you like me to show the diff again against the current version?"
- Do not apply blindly
