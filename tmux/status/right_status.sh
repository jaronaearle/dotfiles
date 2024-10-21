#!/bin/bash

function load_average() {

  printf "%s " "$(uptime | awk -F: '{printf $NF}' | tr -d ',')"

}

function battery_status() {

  # Get the remaining capacity of all attached batteries.
  capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null | tr '\n' '+' | sed 's/\+$//')

  # Get the remaining capacity of all attached batteries.
  status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null | sort | uniq)

  # If the status of all batteries is charging, display a charging icon.
  if [ "$status" == "Charging" ]; then
    printf " "
  # If the status of all batteries is discharging, display a discharging icon.
  elif [ "$status" == "Discharging" ]; then
    printf " "
  fi

  # Calculate the remaining capacity of all attached batteries.
  capacity=$(bc -l <<<"$capacity" 2>/dev/null)

  # If the remaining capacity is less than 10%, display a warning icon.
  if (($(echo "$capacity < 10" | bc -l))); then
    printf " "
  # If the remaining capacity is less than 25%, display a quarter charged icon.
  elif (($(echo "$capacity < 25" | bc -l))); then
    printf " "
  # If the remaining capacity is less than 50%, display a half charged icon.
  elif (($(echo "$capacity < 50" | bc -l))); then
    printf " "
  # If the remaining capacity is less than 75%, display a three quarters charged icon.
  elif (($(echo "$capacity < 75" | bc -l))); then
    printf " "
  # If the remaining capacity is less than 100%, display a full battery icon.
  elif (($(echo "$capacity < 100" | bc -l))); then
    printf " "
  fi

  # Display the remaining capacity of all attached batteries.
  printf "%s%% " "$capacity"

}

function today() {
  # printf "It's %s" "$(date +'%A')"
  printf "It's fucking %s" "$(date +'%A')"
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
  today
  spacer
  date_time
}

main
