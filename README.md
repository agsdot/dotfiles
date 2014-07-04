Them dots, here's my setup so far for vim and emacs.  Heads up folks, emacs is setup for evil mode / modal editing. 

Also, both vim and emacs are setup to use the ; semicolon instead of the : colon to get into a command mod. 

Instructions, clone the project.

- git clone --recursive git@github.com:agsdot/dotfiles.git ~/dotfiles  
- cd dotfiles  
- git submodule update --init --remote (make sure that we are on the correct submodule branch)  
- Run the makesymlinks.sh script  
- Run the setupGitconfig.sh script  
- Run the setupVim.sh script  

http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/  

http://joncairns.com/2011/10/how-to-use-git-submodules/  

P.s. Super impressed by the power of git clone --recursive.  Wow/whoa, when sourcing submodules that have submodules themselves, the recursive command takes care of that whole inception stuff.  Wow!  

P.s.s. Just added the third step for submodule update init remote, because I wanted to make sure that neotree was on the correct branch (dev vs master). This command kinda negates the need for the recursive in the first command--I don't have any projects right now with deep nesting of submodules. But I'm am leaving it as a precautionary measure for the future submodules if they have dependencies as such. Super props to this [SO article](http://stackoverflow.com/a/20016830/2741455). 

P.s.s.s. On mac and linux systems, make sure you have the right build tools.  On Mac, homebrew and xcode stuffs, on linux, I needed in ubuntu to sudo apt-get install python-dev (for YouCompleteMe to compile). Hum...maybe some other stuff too, oh yah, the youcompleteme install logs said something about boost.  Forgot, will notate it, once I run these dotfiles again (spin up a vagrant ubuntu vm anyone?)....  

