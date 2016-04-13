#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.


##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..."
sudo apt-get update -fy;
sudo apt-get upgrade -fy;
sudo apt-get dist-upgrade -fy;
echo "done"

#######################
##apt-get installations
echo ">>Installing new software..."
sudo apt-get install -fy gcc-multilib g++-multilib thefuck wget curl zsh python python3 vim-runtime vim-gui-common
echo "done"

###################
##PIP installations
echo ">>Grabbing pip..."
wget https://bootstrap.pypa.io/get-pip.py
echo "done"
echo ">>Installing pip..."
sudo python get-pip.py
echo "done"

echo ">>PIP>>Installing python requests..."
sudo pip install requests
echo "done"
echo ">>PIP>>Installing capstone..."
sudo pip install capstone
echo "done"
echo ">>PIP>>Installing ROPgadget..."
sudo pip install ropgadget
echo "done"

#####################
##Radare2 Install
echo ">>Git Cloning radare2..."
git clone https://github.com/radare/radare2.git
echo "done"

echo ">>Installing radare2..."
./sys/install.sh
echo "done"

#######################
##Peda Install
echo ">>Installing peda..."
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "done"

######################
##Oh-My-Zsh Install
echo ">>Installing Oh-My-Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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
mkdir ~/.fonts;
mv PowerlineSymbols.otf ~/.fonts/;
mkdir ~/.config/fontconfig
mkdir ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -fv ~/.fonts/
echo ">>Font Installation done, for now you will need to manually change theme in .zshrc to agnoster"
echo "done"

