#!/bin/bash

if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
    echo -n "#[fg=colour1,bold](SSH)     #[default]"
fi
