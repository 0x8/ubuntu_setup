#!/bin/bash

############################################
#Nullp0inter's ubuntu configuration part two
#Continues in Zsh where the last part stopped
echo "done"

#########################
##Oh-My-Zsh configuration
echo "unsetopt no_match" >> ~/.zshrc
echo ">>Changing theme to agnoster"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/$USER@%m/$USER/' ~/.oh-my-zsh/themes/agnoster.zsh-theme
sed -i 's/%~/%c/' ~/.oh-my-zsh/themes/agnoster.zsh-theme
echo "done"

######################
##Create Aliases File
echo ">>Generating zsh aliases file"
if [ -f '~/.aliases' ]
    then
        echo "found existing .alias file, backing up to ~/.aliases.orig"
        cp '~/.aliases' '~/.aliases.orig'
        echo "Backup complete. Adding new aliases"
        echo "[!!WARNING!!] If you have a .alias file already..."
        echo "[!!WARNING!!] this can get pretty messy. Manually "
        echo "[!!WARNING!!] double-check the new aliases for    "
        echo "[!!WARNING!!] duplicates, etc."
fi

if [ ! -f './.aliases' ]
    then    
        touch ~/.aliases;
        echo "##UTILITY" >> ~/.aliases;
        echo "alias ll='ls -la'" >> ~/.aliases;
        echo "alias q='exit'" >> ~/.aliases;
        echo "alias ropg='ROPgadget'" >> ~/.aliases;
        echo "" >> ~/.aliases;
        echo "##Directories" >> ~/.aliases;
        echo "done"

        echo ">>Editing .zshrc to use new alias file AND to use thefuck"
        echo "source \$HOME/.aliases" >> ~/.zshrc
        echo "eval \$(thefuck --alias)" >> ~/.zshrc
        echo "done"

        echo ">>Adding alias file to bashrc"
        echo "[if [ -f ~/.aliases]; then" >> .bashrc
        echo "    . ~/.aliases" >> .bashrc
        echo "fi" >> .bashrc
        echo "done"
fi
if [ -f './.aliases' ]
    then
        mv './.aliases' ~
fi

#################
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
echo "done"

#This is just for me, feel free to change it if you'd like
#these repos are all public though some will be useless to you i'd imagine
if [ $USER == nullp0inter ]; then
	mkdir ~/Documents/Github
fi

##################
##zshrc and bashrc
if [ -f './.bashrc' ]
    then
        mv './.bashrc' ~
fi
if [ -f './.zshrc' ]
    then 
        mv './.zshrc' ~
fi

################
##System Restart
echo ">>Script done. RESTARTING NOW..."
sudo shutdown -r 0;
