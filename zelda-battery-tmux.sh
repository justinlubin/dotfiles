#!/bin/bash

width="$(tmux display -p '#{client_width}')"

if [[ $width -ge $1 ]]; then
    # Source: https://gist.github.com/stephencelis/4324139
    # Test if we have the pmset command
    command -v pmset >/dev/null 2>&1 || exit

    ~/dotfiles/zelda-battery.sh
    echo -n "     "
fi
