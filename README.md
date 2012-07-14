## About

This is my own vim configuration files for both Linux and Mac OS

## vim initialize

VIM Init:

    git clone git://github.com/xiaoquqi/dotfiles.git
    cd dotfiles
    # this will backup your old .vimrc and .vim then create the link and 
    # install all neccessary vim plugins for you
    ./vim_init.sh

Manually Install vim plugins, Launch vim, in vim run:

    Run :BundleInstall

or use command line:

    vim +BundleInstall +qall

