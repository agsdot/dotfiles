#!/bin/sh

git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.st "status -bs"

# better git log displays
git config --global alias.g "log --graph --pretty=custom"
git config --global alias.l "log --pretty=custom"

git config --global pretty.custom "%C(magenta)%h%C(red)%d %C(yellow)%ar %C(green)%s %C(yellow)(%an)"
#custom = "%C(magenta)%h%C(red)%d %C(yellow)%ar %C(green)%s %C(yellow)(%an)"
#                     │        │            │            │  author name ┘
#                     │        │            │            └─ message
#                     │        │            └─ date (relative)
#                     │        └─ decorations (branch, heads or tags)
#                     └─ hash (abbreviated)

git config --global core.excludesfile "~/.gitignore_global"

