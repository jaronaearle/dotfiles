#!/bin/bash

SCRIPT_PATH="$HOME/.config/tmux/status/right_status.sh"
echo $SCRIPT_PATH

if [[ ! -f "$SCRIPT_PATH" ]]; then
  echo "Error: Script not found at $SCRIPT_PATH"
  echo "Usage: $0 [path_to_script]"
  exit 1
fi

if grep -q "^  todayExplicit$" "$SCRIPT_PATH"; then
  sed -i '' 's/^  todayClean$/  # todayClean/' "$SCRIPT_PATH"
  sed -i '' 's/^  todayExplicit$/  todayClean/' "$SCRIPT_PATH"
  echo "Switched to clean mode (office-friendly)"
elif grep -q "^  todayClean$" "$SCRIPT_PATH"; then
  sed -i '' 's/^  todayClean$/  todayExplicit/' "$SCRIPT_PATH"
  sed -i '' 's/^  # todayExplicit$/  todayExplicit/' "$SCRIPT_PATH"
  echo "Switched to explicit mode"
else
  echo "Error: Could not find active function call"
  exit 1
fi
