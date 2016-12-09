#!/bin/bash

# The installation directory
dir=~/dotfiles

# The backup directory
old_dir=~/.dotfiles_old

# The dotfiles to handle
files="vimrc tmux.conf bashrc"

# Link new dotfiles and backup old ones
mkdir -p $old_dir
cd $dir
for file in $files; do
    mv ~/.$file $old_dir
    ln -s $dir/$file ~/.$file
done

# Install vim plugins
mkdir "~/.vim"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
ln -s $dir/UltiSnips ~/.vim/
ln -s $dir/vim_syntax ~/.vim/syntax

# Install base16 color schemes
mkdir ~/.config
cd ~/.config
git clone "https://github.com/chriskempson/base16-shell"
git clone "https://github.com/chriskempson/base16-iterm2"
if [ "$(uname)" == "Darwin" ]; then
    printf "$(tput bold && tput setaf 3)** NOTE: Do not forget to install AND enable the desired iTerm2 theme located in ~/.config/base16-iterm2. Make sure to use the 256 variant.\n"
fi
