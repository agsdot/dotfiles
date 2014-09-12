#!/bin/sh

git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.st "status -bs"

# better git log displays
git config --global alias.g "log --graph --pretty=custom"
git config --global alias.l "log --pretty=custom"

git config --global core.excludesfile "~/.gitignore_global"

