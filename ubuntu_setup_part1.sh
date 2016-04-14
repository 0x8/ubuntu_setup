#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.


##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..."
sudo apt-get update;
sudo apt-get upgrade -qfy;
sudo apt-get dist-upgrade -qfy;
echo "done"

#######################
##apt-get installations
echo ">>Installing new software..."
sudo apt-get install -fy open-vm-tools-* gcc-multilib g++-multilib thefuck wget curl zsh python python3 vim-runtime vim-gui-common
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
#echo ">>PIP>>Installing capstone..."
#sudo pip install capstone
#echo "done"
#echo ">>PIP>>Installing ROPgadget..."
#sudo pip install ropgadget
#echo "done"

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
