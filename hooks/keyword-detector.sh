#!/bin/bash
# Say-Your-Harmony Keyword Detector Hook
# Detects harmony/ultrathink/search/analyze keywords

INPUT=$(cat)

PROMPT=""
if command -v jq &> /dev/null; then
  PROMPT=$(echo "$INPUT" | jq -r '
    if .prompt then .prompt
    elif .message.content then .message.content
    elif .parts then ([.parts[] | select(.type == "text") | .text] | join(" "))
    else ""
    end
  ' 2>/dev/null)
fi

if [ -z "$PROMPT" ] || [ "$PROMPT" = "null" ]; then
  PROMPT=$(echo "$INPUT" | sed -n 's/.*"\(prompt\|content\|text\)"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\2/p' | head -1)
fi

if [ -z "$PROMPT" ]; then
  echo '{"continue": true}'
  exit 0
fi

PROMPT_NO_CODE=$(echo "$PROMPT" | sed 's/```[^`]*```//g' | sed 's/`[^`]*`//g')
PROMPT_LOWER=$(echo "$PROMPT_NO_CODE" | tr '[:upper:]' '[:lower:]')

# Check for harmony keywords (multilingual)
if echo "$PROMPT_NO_CODE" | grep -qE '(harmony|4-phase|four.?phase|하모니|4단계|ハーモニー|armonía|harmonie)'; then
  cat << 'EOF'
{"continue": true, "message": "<harmony-mode>\n\n**4-PHASE DEVELOPMENT ACTIVATED**\n\nEvery task follows: Planning → Design → Implementation → Operation\n\nAgents: planner, architect, builder, operator, explorer, documenter, meta-analyzer\n\nTarget: 4.25x efficiency via parallel execution + meta-analysis for continuous improvement.\n\n</harmony-mode>\n\n---\n"}
EOF
  exit 0
fi

# Check for ultrathink keywords (multilingual)
if echo "$PROMPT_NO_CODE" | grep -qE '(ultrathink|울트라씽크|깊게생각|深く考え|pensar profundo)'; then
  cat << 'EOF'
{"continue": true, "message": "<think-mode>\n\n**ULTRATHINK MODE ENABLED**\n\nDeep analysis activated:\n1. Consider 3+ alternatives\n2. Document tradeoffs\n3. Identify risks\n4. Structured reasoning\n\n</think-mode>\n\n---\n"}
EOF
  exit 0
fi

echo '{"continue": true}'
exit 0
