#!/bin/bash

CMD="colorls --tree=1"

if [ ! "$#" -eq 0 ]; then
    for ARG in "$@"
    do
        if [[ $ARG  =~ ^[0-5]+$ ]]; then
            TREE=$([ "$ARG" -lt 5 ] && echo "$ARG" || echo 1)
            CMD=$(echo "$CMD" | sed -r "s/1/$TREE/g")
        else
            CMD="${CMD} ${ARG}"
        fi
    done
fi

eval "$CMD"
