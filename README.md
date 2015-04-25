## About

This is my own dotfile configuration files for both Linux and Mac OS

Tested on Ubuntu 14.04

## Install

### Required:

* vim(>= 7.3.584 with python2 support)
* cmake(> 2.8.7)

### Ubuntu

Before you run vim, you also need to install an extra package called ctags, in ubuntu 12.04, you can run:

    sudo apt-get install exuberant-ctags

Otherwise, you need to build from source http://ctags.sf.net

### vim initialization:

    git clone git://github.com/xiaoquqi/dotfiles.git
    cd dotfiles
    ./install.sh

## Reference

* How to compile vim: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
