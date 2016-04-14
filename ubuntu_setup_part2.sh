#!/bin/zsh

#nullp0inter's ubuntu configuration part2
#Continues in Zsh where the last part left off

##########################
##Oh-My-Zsh configuration
unsetopt no_match
echo ">>If Shell does not start into zsh upon restart, run chsh -s zsh"
echo "done"

######################
##Create Aliases File
echo ">>Generating zsh aliases file"
touch ~/.aliases
echo "##UTILITY" >> ~/.aliases;
echo "alias ll='ls -la'" >> ~/.aliases;
echo "alias q='exit'" >> ~/.aliases;
echo "alias ropg='ROPgadget'" >> ~/.aliases;
echo "" >> ~/.aliases
echo "##Directories" >> ~/.aliases
echo "done"

echo ">>Editing .zshrc to use new alias file AND to use thefuck"
echo "source \$HOME/.aliases" >> ~/.zshrc
echo "eval \$(thefuck --alias)" >> ~/.zshrc
echo "done"

#############################
##Powerline fonts
echo ">>Installing powerline fonts"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
mkdir ~/.config
mkdir ~/.config/fontconfig
mkdir ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -fv ~/.fonts/
echo ">>Font Installation done, for now you will need to manually change theme in .zshrc to agnoster"
echo "done"

############################
##System Restart
echo ">>Script done. RESTARTING NOW..."
sudo shutdown -r 0;
