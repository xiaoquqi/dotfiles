#!/bin/bash

# This scirpt used for vim configuration initialization
# Author: Ray Sun
# Email: xiaoquqi@gmail.com
# Latest Update: 2012-07-14

# Make link to .vimrc and .vim directory, if already existing, mv them to
# .vimrc.old.timestamp .vim.old.timestamp

cd $(dirname $0)
BASE_DIR=`pwd`

NEW_VIMRC="$BASE_DIR/vim/vimrc"
NEW_VIM="$BASE_DIR/vim"

DOT_VIMRC="$HOME/.vimrc"
DOT_VIM="$HOME/.vim"

TIMESTAMP=`date +"%y%m%d%H%m%S"`
DOT_VIMRC_BAK="$DOT_VIMRC.$TIMESTAMP"
DOT_VIM_BAK="$DOT_VIM.$TIMESTAMP"

# return true if the same file
function same_file {
  link_source_file=`readlink $1`
  if [ $link_source_file -ef $2 ]; then
    return 1
  else
    return 0
  fi
}

# backup file and create link
function create_link {
  echo "Your $1 backup to $2"
  mv $1 $2
  ln -s $3 $1
}

# .vimrc
if [ -e $DOT_VIMRC ]; then
  # if it's already a link, test if it's link to us
  same_file $DOT_VIMRC $NEW_VIMRC
  is_same_file=$?
  if [ -L $DOT_VIMRC ] && [ $is_same_file -eq 1 ]
  then
    echo "Link existing no need to create for $DOT_VIMRC"
  else
    create_link $DOT_VIMRC $DOT_VIMRC_BAK $NEW_VIMRC
  fi
  else
    create_link $DOT_VIMRC $DOT_VIMRC_BAK $NEW_VIMRC
fi

# .vim
if [ -e $DOT_VIM ]; then
  # if it's already a link, test if it's link to us
  same_file $DOT_VIM $NEW_VIM
  is_same_file=$?
  if [ -L $DOT_VIM ] && [ $is_same_file -eq 1 ]
  then
    echo "Link existing no need to create for $DOT_VIM"
  else
    create_link $DOT_VIM $DOT_VIM_BAK $NEW_VIM
  fi
  else
    create_link $DOT_VIM $DOT_VIM_BAK $NEW_VIM
fi

# Go back to dotfiles do git submodule init
cd $BASE_DIR
git submodule update --init

# Install vim plugins
vim +BundleInstall +qall

echo "Configurate VIM Done"
