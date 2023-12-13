#!/bin/bash

brah="$(git branch --show-current)"
echo "$brah"

if [ -z "$brah" ]; then
	exit 0
fi

read -rp "Set upstream origin to $brah? (y/n):" yn </dev/tty
if echo "$yn" | grep "^[Yy]$"; then
	git sup "$brah"
fi
