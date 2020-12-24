#!/bin/bash

# The installation directory
dir=~/dotfiles

# The backup directory
old_dir=~/.dotfiles_old

if [ -d "$old_dir" ]; then
  echo "You must take care of $old_dir first!"
  exit 1
fi

# The dotfiles to handle
files="vimrc tmux.conf bashrc zshrc agignore tinyvimrc gitconfig"

# Link new dotfiles and backup old ones
mkdir -p $old_dir
cd $dir
for file in $files; do
  mv ~/.$file $old_dir
  ln -s $dir/$file ~/.$file
done

# Also handle fish.config
mkdir -p ~/.config/fish
mv ~/.config/fish/config.fish $old_dir
ln -s $dir/config.fish ~/.config/fish/config.fish

# Fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install FabioAntunes/base16-fish-shell
base16-gruvbox-dark-hard

# To install fish:
#   brew install fish
#   echo /usr/local/bin/fish | sudo tee -a /etc/shells
#   chsh -s /usr/local/bin/fish

# Install vim plugins
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
