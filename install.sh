#!/bin/bash

#
# This scirpt used for all dotfiles configurations. Currently this only
# contains vim configurations.
#
# Create link to .vimrc and .vim directory, if they are already existing,
# rename them to .vimrc.bak .vim.bak
#
# Author: Ray Sun
# Email: xiaoquqi@gmail.com
# Latest Update: 2015-04-25
#

BASE_DIR=$(cd $(dirname $0); pwd)

NEW_VIMRC="$BASE_DIR/vim/vimrc"
NEW_VIM="$BASE_DIR/vim"

DOT_VIMRC="$HOME/.vimrc"
DOT_VIM="$HOME/.vim"

DOT_VIMRC_BAK="$DOT_VIMRC.bak"
DOT_VIM_BAK="$DOT_VIM.bak"

VUNDLE_PATH="$BASE_DIR/vim/bundle/Vundle.vim"

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

if [[ -e $VUNDLE_PATH ]]; then
  rm -rf $VUNDLE_PATH
fi

mkdir -p $VUNDLE_PATH
git clone https://github.com/gmarik/Vundle.vim.git $VUNDLE_PATH

# Install vim plugins
vim +PluginInstall +qall

echo "Vim Configuration Done"
