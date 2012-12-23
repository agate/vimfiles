#!/bin/bash

function die() {
  echo "${@}"
  exit 1
}

# Add .old to any existing Vim file in the home directory
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
  fi
done

# Clone Vimfiles into .vim
git clone git://github.com/agate/vimfiles.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
vim +BundleInstall +qall

echo "DONE!"
