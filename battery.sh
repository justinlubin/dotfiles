#!/bin/bash

command -v pmset >/dev/null 2>&1 || exit;

battery="$(pmset -g ps | awk 'NR==2' | perl -pe 's/.*?(\d+)%.*/\1/')"
discharging="$(pmset -g ps | grep dis)"

dischargingcolor="01"
chargingcolor="03"

if [[ $discharging ]]; then
    echo -n "#[fg=colour$dischargingcolor]"
else
    echo -n "#[fg=colour$chargingcolor]"
fi

echo -n "${battery}%"

if [[ $discharging ]]; then
    echo -n " (-)"
else
    echo -n " (+)"
fi
