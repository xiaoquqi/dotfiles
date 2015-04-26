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

BUNDLE_PATH="$BASE_DIR/vim/bundle"
VUNDLE_PATH="$BUNDLE_PATH/Vundle.vim"

YOUCOMPLETEME_PATH="$BUNDLE_PATH/YouCompleteMe"
YCM_CLIENT_SUPPORT_PATH="$YOUCOMPLETEME_PATH/third_party/ycmd/ycm_client_support.so"

if [[ -e $DOT_VIMRC ]]; then
  echo "Backup $DOT_VIMRC to $DOT_VIMRC_BAK"
  mv $DOT_VIMRC $DOT_VIMRC_BAK
fi
ln -s $NEW_VIMRC $DOT_VIMRC

if [[ -e $DOT_VIM ]]; then
  echo "Backup $DOT_VIM to $DOT_VIM_BAK"
  if [[ -e $DOT_VIM_BAK ]]; then
    rm -rf $DOT_VIM_BAK
  fi
  mv $DOT_VIM $DOT_VIM_BAK
fi
ln -s $NEW_VIM $DOT_VIM

# vundle Installation
if [[ -e $VUNDLE_PATH ]]; then
  cd $VUNDLE_PATH
  git pull
else
  # get vundle
  mkdir -p $VUNDLE_PATH
  git clone https://github.com/gmarik/Vundle.vim.git $VUNDLE_PATH
fi

# YouCompleteMe Dependencies Installation
if [[ -e $YOUCOMPLETEME_PATH ]]; then
  cd $YOUCOMPLETEME_PATH
  git pull
else
  mkdir -p $YOUCOMPLETEME_PATH
  git clone https://github.com/Valloric/YouCompleteMe.git $YOUCOMPLETEME_PATH
fi

cd $YOUCOMPLETEME_PATH
git submodule update --init --recursive

# Install YouCompleteMe
if [[ ! -e $YCM_CLIENT_SUPPORT_PATH ]]; then
  $YOUCOMPLETEME_PATH/install.sh
fi

# Install vim plugins
vim +PluginInstall +qall

echo "Vim Configuration Done"
