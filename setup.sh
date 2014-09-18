#!/bin/bash

############################
# Run the setup scripts for these dotfiles
############################

echo "Making symlinks to the dotfiles"
./scripts/makesymlinks.sh
echo ""
echo "Setup the git configs"
./scripts/setupGitconfig.sh
echo ""
echo "Run scripts to initialize Vim plugins dependencies"
./scripts/setupVim.sh
echo ""

