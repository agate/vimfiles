# My vim config files

##How to install:

### Manually

    $ git clone git://github.com/agate/vimfiles.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim
    $ git submodule init
    $ git submodule update
    $ vim +BundleInstall +qall

### Automatic installer

    $ curl -Lo- https://github.com/agate/vimfiles/blob/master/bootstrap.sh | bash
