#!/bin/bash

echo "Setup vimproc (allows Unite grep project find to work)"
cd ~/dotfiles/vim/bundle/vimproc.vim

if [ "$(uname)" == "Darwin" ]; then
  make -f make_mac.mak
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  make -f make_unix.mak
fi

echo "...done"
