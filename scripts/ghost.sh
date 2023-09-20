#!/bin/bash

TMP=~/Org/temp.txt
ORG_DIR=~/Org/org
SYNC_DIR=~/Sync/Org

diff -qrs  $ORG_DIR $SYNC_DIR | awk 'OFS=":" {print $2,$4,$NF}' > $TMP

while IFS= read -r line; do
  GIT_FP=$(echo "$line" | cut -d ":" -f 1)
  SYNC_FP=$(echo "$line" | cut -d ":" -f 2)
  STATUS=$(echo "$line" | cut -d ":" -f 3)
  
  if [ "$STATUS" = "differ" ]; then
    echo "$GIT_FP -> $SYNC_FP"
    cat "$GIT_FP" > "$SYNC_FP"
  fi
done < $TMP

rm $TMP
