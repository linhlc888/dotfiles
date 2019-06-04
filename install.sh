#!/bin/bash
set -xe
today=$(date +%F)
if [ -f ~/.tmux.conf ];then
  mv ~/.tmux.conf "$HOME/.tmux.conf.$today.bak"
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
else
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

fi

if [ -f ~/.vimrc ];then
  mv ~/.vimrc "$HOME/.vimrc.$today.bak"
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
else
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -e ~/.vim/autoload/plug.vim ];then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
