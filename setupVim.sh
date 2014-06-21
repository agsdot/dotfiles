#!/bin/bash

# Download neobundle
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Setup vimproc (allows Unite grep project find to work)
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/.vim/bundle/vimproc.vim

if [ "$(uname)" == "Darwin" ]; then
  make -f make_mac.mak
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  make -f make_unix.mak
fi
