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

files="vimrc vimrc_background tmux.conf tinyvimrc gitconfig"

# Link new dotfiles and backup old ones

mkdir -p $old_dir
cd $dir
for file in $files; do
  mv ~/.$file $old_dir
  ln -s $dir/$file ~/.$file
done

# alacritty

mkdir -p ~/.config/alacritty
mv ~/.config/alacritty/alacritty.toml $old_dir
ln -s $dir/alacritty.toml ~/.config/alacritty/alacritty.toml

# fish configuration

mkdir -p ~/.config/fish
mv ~/.config/fish/config.fish $old_dir
ln -s $dir/config.fish ~/.config/fish/config.fish

# nvim configuration

mkdir -p ~/.config/nvim
mv ~/.config/nvim/init.vim $old_dir
ln -s $dir/init.vim ~/.config/nvim/init.vim

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

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qall
