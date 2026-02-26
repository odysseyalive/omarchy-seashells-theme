# Diagnosis Protocol

How to determine whether friction originated in the skill's own instructions.

## When to Run

Run this protocol at **natural task resolution** — the moment when:
- The user signals the task is done ("thanks", "perfect", "that's it", "okay we're good")
- The conversation reaches a clear stopping point
- The user moves to a new topic

Do NOT run mid-session. Do NOT run after every response. Wait for resolution.

## Step 1: Assess the Friction Log

Review the internally held friction log from the session.

If the log is empty -> no diagnosis needed. Session was clean. Stop here.

If the log contains only Quality signals (low confidence) and no Explicit or Implicit signals -> skip diagnosis.

If the log contains at least one Explicit or Implicit signal -> proceed to Step 2.

## Step 2: Spawn Root-Cause Analyst

Spawn the root-cause-analyst agent (`context: none`) with:
- The skill's full SKILL.md content
- The friction log (signal type, text, turn, hypothesis)
- The task summary (what was being accomplished)
- The target skill's `eval-history.md` (if it exists)

The agent returns one of three verdicts:

**SKILL_CAUSED** — The friction traces to a specific instruction in the skill.
- Must name the exact section and approximate line
- Must quote the specific instruction that caused the misrepresentation
- Must explain the causal chain

**REASONING_CAUSED** — The friction was a reasoning error, not an instruction error.
- No skill update warranted. Stop here.

**AMBIGUOUS** — Cannot determine with confidence.
- Do not propose an update. Stop here.

## Step 2b: Check Self-Heal History

Check `self-heal-history.md` for the target skill. If the same instruction was previously diagnosed and a patch was declined, do not re-propose the same change.

## Step 3: Spawn Patch Reviewer (only if SKILL_CAUSED)

Spawn the patch-reviewer agent (`context: none`) with:
- The specific instruction identified as the source
- The full surrounding section for context
- The proposed fix

The patch-reviewer checks:
1. **Minimality** — Is this the smallest change that fixes the root cause?
2. **Completeness** — Does it actually fix the misrepresentation?
3. **Directive safety** — Does it touch any directive? If yes, REJECT.
4. **New ambiguity** — Does the proposed change introduce a new unclear term?

Returns: APPROVED or REJECTED with reason.

If REJECTED -> do not propose to user. Stop here.

## Step 4: Present to User (only if patch-reviewer APPROVED)

Present naturally, as part of the conversation:

```
I noticed I had some trouble with [brief description] earlier.
I think it came from how this skill describes [specific area].

Here's what I'd suggest changing:

**Current:**
[Exact quoted text]

**Proposed:**
[Exact replacement text]

Would you like me to update the skill?
```

## Step 5: Apply (only with explicit user approval)

If approved:
1. Read the skill's current SKILL.md
2. Apply the exact change shown — nothing more
3. Confirm: "Updated. The skill now says [new text]."
4. Append record to target skill's `self-heal-history.md`

If declined:
1. Acknowledge: "No problem — I'll leave it as is."
2. Do not retry or mention again.

## Root Causes In Scope

| Content Type | In Scope? |
|-------------|-----------|
| Workflow step descriptions | YES |
| Context/framing statements | YES |
| Clarifying language and examples | YES |
| Scope descriptions | YES |
| Directives | **NEVER** |
| Reference file content | NO |
| Agent definitions | NO |
| Frontmatter | NO |
