#!/bin/bash

dir=~/dotfiles
old_dir=~/dotfiles_old
files="vimrc"

mkdir -p $old_dir
cd $dir
for file in $files; do
    mv ~/.$file ~/dotfiles_old
    ln -s $dir/$file ~/.$file
done

