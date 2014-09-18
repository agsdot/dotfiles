Them dots, here's my setup so far for vim and emacs (7.4 and 24.3 respectively).  Heads up folks, emacs is setup for evil mode / modal editing.  

Also, both vim and emacs are setup to use the ; semicolon instead of the : colon to get into a command mod.  

Open a terminal and do the following:  

- git clone --recursive git@github.com:agsdot/dotfiles.git ~/dotfiles (Clone the project and all submodules)  
- cd dotfiles  
- git submodule update --init --remote (make sure that we are on the correct submodule branch)  
- ./setup.sh (Run setup script, which initializes the setup files within the scripts directory)  

The following links helped in the setup of these dotfiles:  
  - http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/  
  - http://joncairns.com/2011/10/how-to-use-git-submodules/  

P.s. Super impressed by the power of git clone --recursive.  Wow/whoa, when sourcing submodules that have submodules themselves, the recursive command takes care of that whole inception stuff.  Wow!  
