set -xe
if [ -e ~/.tmux.conf ];then
  mv ~/.tmux.conf ~/.tmux.conf.`date +%F`.bak
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
fi

if [ -e ~/.vimrc ];then
  mv ~/.vimrc ~/.vimrc.`date +%F`.bak
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
fi
if [ ! -e ~/.vim/autoload/plug.vim ];then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
