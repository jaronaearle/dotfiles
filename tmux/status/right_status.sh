#!/bin/bash

function load_average() {
  printf "%s " "$(uptime | awk -F: '{printf $NF}' | tr -d ',')"
}

function todayExplicit() {
  printf "It's fucking %s" "$(date +'%A')"
}

function todayClean() {
  printf "It's %s" "$(date +'%A')"
}

function date_time() {
  printf "%s " "$(date +'%m-%d-%Y %H:%M %Z')"
}

function spacer() {
  printf " | "
}

function main() {
  spacer
  load_average
  spacer
  # todayClean
  todayExplicit
  spacer
  date_time
}

main
