#!/bin/bash

exec 1>&2

# Terminal colors and formats
lightRed='\033[1;31m'
green='\033[0;32m'
yellow='\033[1;33m'
clearFormat='\033[0m'
underline='\033[4m'
strikeStart='\e[9m'
strikeEnd='\e[29m'

deleteBranchFlag=0

safeBranches="main|master"

showBranches() {
	git branch | grep -Ev $safeBranches
}
checkBranches() {
	if [ -z "$1" ]; then
		return 0
	fi

	if [ "$(git branch | grep -Ec $safeBranches)" != 0 ]; then
		printf "> %b%b%s%b\n" "$yellow" "$underline" "$1" "$clearFormat"

		deleteBranchFlag=1
	fi

}

confirm() {
	printf '%b\nDelete Local Branches?%b' "$lightRed" "$clearFormat"
	read -rp " (y/n): " yn </dev/tty
	printf '%b' "$clearFormat"

	if echo "$yn" | grep "^[Yy]$"; then
		cleanup
	else
		printf '\n%bNothing to clean, exiting...\n%b' "$green" "$clearFormat"
		exit 1
	fi
}

cleanup() {
	for branch in $(showBranches); do
		printf "\n> %bDeleting branch: " "$clearFormat"
		printf "%b%b%s%b" "$yellow" "$underline" "$branch" "$clearFormat"
		sleep 0.1
		printf "%b " "$lightRed"
		sleep 0.1
		printf "%b." "$lightRed"
		sleep 0.1
		printf "%b " "$lightRed"
		sleep 0.1
		printf "%b." "$lightRed"
		sleep 0.1
		printf "%b " "$lightRed"
		sleep 0.1
		printf "%b." "$lightRed"
		sleep 0.1
		printf "%b " "$lightRed"
		sleep 0.1
		printf "%b%s" "$strikeStart" "$branch"
		sleep 0.1
		printf "%b%b " "$strikeEnd" "$clearFormat"
		sleep 0.1
		git branch -dq "$branch"
		sleep 0.2
		printf "%b✓\n%b" "$green" "$clearFormat"
		sleep 0.2
	done
	printf '\n%b' "$clearFormat"
}

gcup() {
	printf "\n%b- Local Branches -\n%b\n" "$yellow" "$clearFormat"

	for line in $(showBranches); do
		checkBranches "$line"
	done

	if [ "$deleteBranchFlag" = 1 ]; then
		confirm
	fi
}

gcup
