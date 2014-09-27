#!/bin/sh

echo "Setup git configs, aliases, and eye candy"

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

echo "Lastly, lets check to see if you've got git-webui installed"
if [ ! -d ~/.git-webui ]; then
  echo "Let's install it right now..."
  curl https://raw.githubusercontent.com/alberthier/git-webui/master/install/installer.sh | bash
  echo "for more information on how to use it goto: https://github.com/alberthier/git-webui "
else
  echo "You've already got it installed..."
fi

echo "...done"
