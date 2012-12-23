# My vim config files

I am using [vundle](https://github.com/gmarik/vundle) as my vim plugin manager.

##How to install:

### Automatic installer

    $ curl -Lo- https://raw.github.com/agate/vimfiles/master/bootstrap.sh | bash

### Manually

> please remember remove your current ~/.vim and ~/.vimrc file

    $ git clone git://github.com/agate/vimfiles.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim
    $ git submodule init
    $ git submodule update
    $ vim +BundleInstall +qall
