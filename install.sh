#!/bin/bash

# The installation directory
dir=~/dotfiles

# The backup directory
old_dir=~/.dotfiles_old

# The dotfiles to handle
files="vimrc tmux.conf bashrc zshrc agignore tinyvimrc gitconfig"

# Link new dotfiles and backup old ones
mkdir -p $old_dir
cd $dir
for file in $files; do
    mv ~/.$file $old_dir
    ln -s $dir/$file ~/.$file
done

# Install vim plugins
mkdir ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
