## About

This is my own vim configuration files for both Linux and Mac OS

## vim initialize

VIM Init:

    git clone git://github.com/xiaoquqi/dotfiles.git
    cd dotfiles
    # this will backup your old .vimrc and .vim then create the link and 
    # install all neccessary vim plugins for you
    # Ignore any errors during installation, this will disapeer after installation
    # line   69:
    # E185: Cannot find color scheme desert256
    # Press ENTER or type command to continue
    ./vim_init.sh

Manually Install vim plugins, Launch vim, in vim run:

    Run :BundleInstall

or use command line:

    vim +BundleInstall +qall

