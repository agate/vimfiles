# My vim config files

I am using [vundle](https://github.com/gmarik/vundle) as my vim plugin manager.

## How to install:

### Automatic installer

```bash
$ curl -Lo- https://raw.github.com/agate/vimfiles/master/bootstrap.sh | bash
```

### Manually

> please remember remove your current ~/.vim and ~/.vimrc file

```bash
$ git clone git://github.com/agate/vimfiles.git ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ cd ~/.vim
$ git submodule init
$ git submodule update
$ vim +PluginInstall +qall
```

## About color

I'm using [getafe](https://github.com/larssmit/vim-getafe) as my vim colorscheme. So if you are using iTerm2 on Mac. You might want to try this color setting ([iterm2-getafe](https://github.com/larssmit/iterm2-getafe)) for your iTerm2 to make your terminal looks better.
