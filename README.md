## About

This is my own dotfile configuration files for both Linux and Mac OS

Tested on Ubuntu 14.04

## Install

### Required:

* vim(>= 7.3.584 with python2 support)
* cmake(> 2.8.7)

### Ubuntu

Before you run vim, you also need to install an extra package called ctags, on ubuntu 14.04,
you can run:

    sudo apt-get install -y exuberant-ctags build-essential cmake python-dev

### Mac

If you are using brew, you need to install cmake to build libs for
YouCompleteMe:

    brew install cmake

### vim initialization:

    git clone git://github.com/xiaoquqi/dotfiles.git
    cd dotfiles
    ./install.sh

## Reference

* How to compile vim: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
