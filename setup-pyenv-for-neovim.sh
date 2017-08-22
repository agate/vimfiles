# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-virtualenv
# https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

pyenv install -l | grep -e "^\s*2.7" | grep -v dev | tail -n1 | xargs pyenv install
pyenv install -l | grep -e "^\s*3" | grep -v dev | tail -n1 | xargs pyenv install
pyenv versions | grep -e "^\s*2\\.7" | grep -v / | tail -n1 | xargs -I{} pyenv virtualenv {} neovim2
pyenv versions | grep -e "^\s*3\\." | grep -v / | tail -n1 | xargs -I{} pyenv virtualenv {} neovim3

pyenv activate neovim2
pip install neovim
pyenv which python  # Note the path

pyenv activate neovim3
pip install neovim
pyenv which python  # Note the path

pip install flake8
mkdir -p ~/bin
ln -s `pyenv which flake8` ~/bin/flake8  # Assumes that $HOME/bin is in $PATH
