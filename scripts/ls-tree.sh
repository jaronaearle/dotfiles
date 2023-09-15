#!/bin/bash

# CMD="colorls --tree=1"
CMD="colorls"
TREE="--tree=1"

if [ ! "$#" -eq 0 ]; then
    for ARG in "$@"
    do
        if [[ $ARG  =~ ^[0-5]+$ ]]; then
            TREE_DEPTH=$([ "$ARG" -lt 6 ] && echo "$ARG" || echo 1)
            CMD="$CMD $(echo "$TREE" | sed -r "s/1/$TREE_DEPTH/g")"
        else 
            CMD="${CMD} ${ARG} ${TREE}"
        fi
    done
else
    CMD="${CMD} ${TREE}"
fi

eval "$CMD"
