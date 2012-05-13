## About

This is my own vim configuration files for both Linux and Mac OS

## vim Usage

1. Create link:

    cd ~
    git clone git@github.com:xiaoquqi/dotfiles.git ~/dotfiles
    ln -s dotfiles/vim/vimrc .vimrc
    ln -s dotfiles/vim .vim
    git submodule update --init

2. Install vim plugins:

    Launch vim
    Run :BundleInstall

or use command line:

    vim +BundleInstall +qall
