#!/bin/bash

# Source: https://gist.github.com/stephencelis/4324139

# Test if we have the pmset command
command -v pmset >/dev/null 2>&1 || exit

# Get system information
battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"
discharging="$(pmset -g ps | grep dis)"

# Configuration
oncolor="09"
offcolor="19"
onheart="♡ "
offheart="♡ "
chargingcolor="11"

# Set color depending on charging status
if [[ -z $discharging ]]; then
    oncolor=$chargingcolor
fi

# Set up variables
heartcount=$((battery / 10))
i=0

# On hearts
echo -n "#[fg=colour$oncolor]"
if [[ $heartcount -eq 0 ]]; then
    echo -n "#[blink]${onheart}#[noblink]"
    i=1
fi
while [ $i -lt $heartcount ]; do
    echo -n "${onheart}"
    i=$((i + 1))
done

# Off hearts
echo -n "#[fg=colour$offcolor]"
while [ $i -lt 10 ]; do
    echo -n "${offheart}"
    i=$((i + 1))
done

# Output lightning if charging
if [[ -z $discharging ]]; then
    echo -n " ⚡  "
fi

# Output the battery percentage
echo -n "#[fg=colour$oncolor]"
echo " ${battery}%"
