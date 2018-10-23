#!/bin/bash

sudo apt-get update && \
  sudo apt-get upgrade -y && \
  sudo apt-get install -y vim zsh tree tmux cdargs git

# set symlinks
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# ssh pub keys

mkdir ~/.ssh 2> /dev/null
cp ~/dotfiles/ssh/authorized_keys ~/.ssh/

# install vim plugins

vim +PluginInstall +qall 

# select zsh as default shell 
command -v zsh >/dev/null 2>&1 && chsh -s $(which zsh)
