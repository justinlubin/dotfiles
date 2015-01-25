#!/bin/bash

# Source: https://gist.github.com/stephencelis/4324139

# Test if we have the pmset command
command -v pmset >/dev/null 2>&1 || exit

battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"
discharging="$(pmset -g ps | grep dis)"

color="09"
if [[ -z $discharging ]]; then
    color="11"
fi

echo -n "#[fg=colour$color]"

if [[ $battery -lt 10 ]]; then
    echo -n "#[blink]♥ #[noblink]♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 20 ]]; then
    echo -n "♥ ♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 30 ]]; then
    echo -n "♥ ♥ ♡ ♡ ♡ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 40 ]]; then
    echo -n "♥ ♥ ♥ ♡ ♡ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 50 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♡ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 60 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♥ ♡ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 70 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♥ ♥ ♡ ♡ ♡ ♡ "
elif [[ $battery -lt 80 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♥ ♥ ♥ ♡ ♡ ♡ "
elif [[ $battery -lt 90 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♡ ♡ "
elif [[ $battery -lt 100 ]]; then
    echo -n "♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♡ "
else
    echo -n "♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ "
fi

if [[ -z $discharging ]]; then
    echo -n " ⚡  "
fi

echo " ${battery}%" 
