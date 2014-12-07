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
