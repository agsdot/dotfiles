Them dots, here's my setup so far for vim and emacs.  Heads up folks, emacs is setup for evil mode / modal editing. 

Also, both vim and emacs are setup to use the ; semicolon instead of the : colon to get into a command mod. 

Instructions, clone the project.

- git clone --recursive git@github.com:agsdot/dotfiles.git ~/dotfiles  
- cd dotfiles  
- Run the makesymlinks.sh script  
- Run the setupVim.sh script  

http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/  

http://joncairns.com/2011/10/how-to-use-git-submodules/  

P.s. Super impressed by the power of git clone --recursive.  Wow/whoa, when sourcing submodules that have submodules themselves, the recursive command takes care of that whole inception stuff.  Wow!

P.s.s. On mac and linux systems, make sure you have the right build tools.  On Mac, homebrew and xcode stuffs, on linux, I needed in ubuntu to sudo apt-get install python-dev (for YouCompleteMe to compile). Hum...maybe some other stuff too, oh yah, the youcompleteme install logs said something about boost.  Forgot, will notate it, once I run these dotfiles again (spin up a vagrant ubuntu vm anyone?)....
