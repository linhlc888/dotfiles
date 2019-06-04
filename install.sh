#!/bin/bash
set -xe
today=$(date +%F)
if [ -e ~/.tmux.conf ];then
  mv ~/.tmux.conf "~/.tmux.conf.$today.bak"
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
fi

if [ -e ~/.vimrc ];then
  mv ~/.vimrc "~/.vimrc.$today.bak"
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -e ~/.vim/autoload/plug.vim ];then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
