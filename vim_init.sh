#!/bin/bash

# This scirpt used for vim configuration initialization
# Author: Ray Sun
# Email: xiaoquqi@gmail.com
# Latest Update: 2015-03-30

# Make link to .vimrc and .vim directory, if they are already existing,
# rename them to .vimrc.bak .vim.bak

BASE_DIR=$(cd $(dirname $0); pwd)

NEW_VIMRC="$BASE_DIR/vim/vimrc"
NEW_VIM="$BASE_DIR/vim"

DOT_VIMRC="$HOME/.vimrc"
DOT_VIM="$HOME/.vim"

DOT_VIMRC_BAK="$DOT_VIMRC.bak"
DOT_VIM_BAK="$DOT_VIM.bak"

if [[ -e $DOT_VIMRC ]]; then
  echo "Backing up $DOT_VIMRC to $DOT_VIMRC_BAK"
  mv $DOT_VIMRC $DOT_VIMRC_BAK
fi
ln -s $NEW_VIMRC $DOT_VIMRC

if [[ -e $DOT_VIM ]]; then
  echo "Backing up $DOT_VIM to $DOT_VIM_BAK"
  if [[ -e $DOT_VIM_BAK ]]; then
    rm -rf $DOT_VIM_BAK
  fi
  mv $DOT_VIM $DOT_VIM_BAK
fi
ln -s $NEW_VIM $DOT_VIM

# Go back to dotfiles do git submodule init
cd $BASE_DIR
git submodule update --init

# Install vim plugins
vim +BundleInstall +qall

echo "Vim Configuration Done"
