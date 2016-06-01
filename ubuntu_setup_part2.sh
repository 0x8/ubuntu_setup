#!/bin/zsh

############################################
#Nullp0inter's ubuntu configuration part two
#Continues in Zsh where the last part stopped

#########################
##Oh-My-Zsh configuration
echo "unsetopt no_match" >> ~/.zshrc
echo ">>Changing theme to agnoster" >> ubuntu_setup.log
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/$USER%m/$USER/' ~/.oh-my-zsh/themes/agnoster.zsh-theme
sed -i 's/%~/%c/' ~/.oh-my-zsh/themes/agnoster.zsh-theme
echo "done" >> ~/ubuntu_setup.log

######################
##Create Aliases File
echo ">>Generating zsh aliases file" >> ~/ubuntu_setup.log
if [ -f '~/.aliases' ]
    then
        echo "found .alias file, backing up to ~/.aliases.orig" >> ~/ubuntu_setup.log
        cp '~/.aliases' '~/.aliases.orig'
        echo "Backup complete. Adding new aliases" >> ~/ubuntu_setup.log
        echo "[!!WARNING!!] If you have a .alias file already..." >> ~/ubuntu_setup.log
        echo "[!!WARNING!!] this can get pretty messy. Manually " >> ~/ubuntu_setup.log
        echo "[!!WARNING!!] double-check the new aliases for    " >> ~/ubuntu_setup.log
        echo "[!!WARNING!!] duplicates, etc." >> ~/ubuntu_setup.log
fi
touch ~/.aliases;
echo "##UTILITY" >> ~/.aliases;
echo "alias ll='ls -la'" >> ~/.aliases;
echo "alias q='exit'" >> ~/.aliases;
echo "alias ropg='ROPgadget'" >> ~/.aliases;
echo "" >> ~/.aliases;
echo "##Directories" >> ~/.aliases;
echo "done" >> ~/ubuntu_setup.log

echo ">>Editing .zshrc to use new alias file AND to use thefuck" >> ~/ubuntu_setup.log
echo "source \$HOME/.aliases" >> ~/.zshrc
echo "eval \$(thefuck --alias)" >> ~/.zshrc
echo "done" >> ~/ubuntu_setup.log

echo ">>Adding alias file to bashrc" >> ~/ubunut_setup.log
echo "[if [ -f ~/.aliases]; then" >> .bashrc
echo "    . ~/.aliases" >> .bashrc
echo "fi" >> .bashrc
echo "done" >> ~/ubuntu_setup.log

#################
##Powerline fonts
echo ">>Installing powerline fonts" >> ~/ubuntu_setup.log
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/
mkdir ~/.config
mkdir ~/.config/fontconfig
mkdir ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -fv ~/.fonts/
echo "done" >> ~/ubuntu_setup.log

#This is just for me, feel free to change it if you'd like
#these repos are all public though some will be useless to you i'd imagine
if [ $USER == nullp0inter ]; then
	mkdir ~/Documents/Github
	cd ~/Documents/Github
	git clone https://github.com/0x8/ubuntu_setup.git
	git clone https://github.com/0x8/CTFs.git
	git clone https://github.com/0x8/buffer_overflows.git
	git clone https://github.com/0x8/ROPstuff.git
	cd
	echo "alias github='cd ~/Documents/Github'" >> ~/.aliases
fi

################
##System Restart
echo ">>Script done. RESTARTING NOW..." >> ~/ubuntu_setup.log
echo ">>Script done. RESTARTING NOW..."
sudo shutdown -r 0;
