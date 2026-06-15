#!/bin/bash
# SeaShells Theme: color-drift awareness hook
# PreToolUse on Edit and Write
# Exits 0 always (awareness, not blocking)
# Warns when hex literals in theme files do not appear in the canonical palette

TOOL_NAME="$1"

if [[ "$TOOL_NAME" != "Edit" && "$TOOL_NAME" != "Write" ]]; then
  exit 0
fi

INPUT=$(cat)

FILE_PATH=$(python3 -c '
import json, sys
try:
    d = json.loads(sys.stdin.read())
    print(d.get("tool_input", {}).get("file_path", ""))
except Exception:
    pass
' <<<"$INPUT" 2>/dev/null)

if [[ "$FILE_PATH" != *"omarchy/themes/"* ]]; then
  exit 0
fi

REF_FILE=".claude/skills/seashells-theme/reference.md"
if [[ ! -f "$REF_FILE" ]]; then
  exit 0
fi

INCOMING_TEXT=$(python3 -c '
import json, sys
try:
    d = json.loads(sys.stdin.read())
    ti = d.get("tool_input", {})
    print(ti.get("new_string", "") or ti.get("content", ""))
except Exception:
    pass
' <<<"$INPUT" 2>/dev/null)

INCOMING=$(echo "$INCOMING_TEXT" | grep -oE '#[0-9a-fA-F]{6}' | tr '[:upper:]' '[:lower:]' | sort -u)
if [[ -z "$INCOMING" ]]; then
  exit 0
fi

CANONICAL=$(grep -oE '#[0-9a-fA-F]{6}' "$REF_FILE" | tr '[:upper:]' '[:lower:]' | sort -u)
UNKNOWN=$(comm -23 <(echo "$INCOMING") <(echo "$CANONICAL"))

if [[ -n "$UNKNOWN" ]]; then
  echo "--- SEASHELLS COLOR DRIFT ---" >&2
  echo "Hex literals in $FILE_PATH are not in canonical palette:" >&2
  while IFS= read -r hex; do
    [[ -n "$hex" ]] && echo "  $hex" >&2
  done <<< "$UNKNOWN"
  echo "Verify against $REF_FILE before committing." >&2
  echo "--- END DRIFT ---" >&2
fi

exit 0
