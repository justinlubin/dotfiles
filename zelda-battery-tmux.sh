#!/bin/bash

width="$(tmux display -p '#{client_width}')"

if [[ $width -ge $1 ]]; then
    ~/dotfiles/zelda-battery.sh
fi
