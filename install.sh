#!/bin/bash

# To install fish (on Mac):
#   brew install fish
#   echo /usr/local/bin/fish | sudo tee -a /etc/shells
#   chsh -s /usr/local/bin/fish

# The installation directory

dir=~/dotfiles

# The backup directory

old_dir=~/.dotfiles_old

if [ -d "$old_dir" ]; then
  echo "You must take care of $old_dir first!"
  exit 1
fi

# The dotfiles to handle

files="vimrc tmux.conf tinyvimrc gitconfig"

# Link new dotfiles and backup old ones

mkdir -p $old_dir
cd $dir
for file in $files; do
  mv ~/.$file $old_dir
  ln -s $dir/$file ~/.$file
done

# fish configuration

mkdir -p ~/.config/fish
mv ~/.config/fish/config.fish $old_dir
ln -s $dir/config.fish ~/.config/fish/config.fish

# Base16 color schemes

git clone \
  https://github.com/chriskempson/base16-shell.git \
  ~/.config/base16-shell

git clone \
  https://github.com/saesh/base16-fish \
  ~/.config/base16-fish

# Vim plugins (and plugin manager)

mkdir -p ~/.vim
curl -fLo \
  ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
