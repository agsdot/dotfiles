#!/bin/bash
echo ""
#echo "Download neobundle"
#mkdir -p ~/.vim/bundle
#git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo ""
echo "Setup vimproc (allows Unite grep project find to work)"
#git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/dotfiles/vim/bundle/vimproc.vim

if [ "$(uname)" == "Darwin" ]; then
  make -f make_mac.mak
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  make -f make_unix.mak
fi

#echo ""
#echo "Setup YouCompleteMe"
#git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
#cd ~/dotfiles/vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#./install.sh


#Temp note: Manual git clone steps obviated by using git submodules step now
