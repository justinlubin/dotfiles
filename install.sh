#!/bin/bash

# The installation directory
dir=~/dotfiles

# The backup directory
old_dir=~/.dotfiles_old

# The dotfiles to handle
files="vimrc tmux.conf bashrc agignore tinyvimrc gitconfig"

# Link new dotfiles and backup old ones
mkdir -p $old_dir
cd $dir
for file in $files; do
    mv ~/.$file $old_dir
    ln -s $dir/$file ~/.$file
done

# Install vim plugins
mkdir ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
ln -s $dir/UltiSnips ~/.vim/
ln -s $dir/vim_syntax ~/.vim/syntax
