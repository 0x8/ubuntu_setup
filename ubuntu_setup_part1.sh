#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.
touch ~/ubuntu_setup.log

##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..." >> ~/ubuntu_setup.log
sudo apt-get -qq update 1> /dev/null;
sudo apt-get -qq upgrade -qfy 1> /dev/null;
sudo apt-get -qq dist-upgrade -qfy 1> /dev/null;
echo "done" >> ~/ubuntu_setup.log

#######################
##apt-get installations
echo ">>Installing new software..." >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy open-vm-tools-* gcc-multilib g++-multilib thefuck wget curl zsh python python3 vim-runtime vim-gui-common python2.7 python2.7-dev python-pip quassel-client texlive-full cinnamon 1> /dev/null
echo "done" >> ~/ubuntu_setup.log

echo ">>PIP>>Installing python requests..." >> ~/ubuntu_setup.log
sudo pip install requests 1> /dev/null
echo "done" >> ~/ubuntu_setup.log
echo ">>PIP>>Installing pwntools..."
sudo -H pip install pwntools 1> /dev/null
echo "done" >> ~/ubuntu_setup.log

#################
##Radare2 Install
echo ">>Git Cloning radare2..." >> ubuntu_setup.log
cd ~
git clone https://github.com/radare/radare2.git
echo "done" >> ~/ubuntu_setup.log

echo ">>Installing radare2..." >> ~/ubuntu_setup.log
./sys/install.sh
if [ -f '/usr/bin/radare2' ]
    then
        echo "[SUCCESS] Installed radare2" >> ~/ubuntu_setup.log
    else
        echo "[!!FAIL!!] Problem installing radare2" >> ~/ubuntu_setup.log
fi
echo "done" >> ~/ubuntu_setup.log

##############
##Peda Install
echo ">>Installing peda..." >> ~/ubuntu_setup.log
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "done" >> ~/ubuntu_setup.log

#########################################
##Install Scud-Cloud, ubuntu slack client
echo ">>Installing scudcloud" >> ~/ubuntu_setup.log
sudo apt-add-repository -y ppa:rael-gc/scudcloud 1> /dev/null
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections 1> /dev/null
sudo apt-get update 1> /dev/null
sudo apt-get install scudcloud 1> /dev/null
if [ -f '/usr/bin/scudcloud' ]
    then
        echo "[SUCCESS] Installed scudcloud" >> ~/ubuntu_setup.log
    else
        echo "[!!FAIL!!] Problem installing scudcloud" >> ~/ubuntu_setup.log
fi
echo "done" >> ~/ubuntu_setup.log

#########################
##LaTeX download (vim-latex)
echo ">>Downloading and setting up vim-latex..." >> ~/ubuntu_setup.log
mkdir ~/tmp
cd ~/tmp
wget 'http://downloads.sourceforge.net/project/vim-latex/snapshots/vim-latex-1.8.23-20141116.812-gitd0f31c9.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fvim-latex%2Ffiles%2F&ts=1464727158&use_mirror=netcologne'
if [ -f vim-latex* ]
    then
        mv vim-latex* setupArchive-vim-latex.tar
        tar -xf setupArchive-vim-latex.tar
        mv vim-latex* ~/.vim
        cd ~/.vim
        if [ -f latextags ]
            then
                cd
                sudo rm -r ~/tmp
                echo "[SUCCESS] Vim-latex setup successful" >> ~/ubuntu_setup.log
        else
            echo "[!!FAIL!!] Something went wrong in vim-latex setup" >> ~/ubuntu_setup.log
        fi
fi
echo "done" >> ~/ubuntu_setup.log

################################
##.vimrc Setup and Configuration
echo ">>Setting up ~/.vimrc" >> ~/ubuntu_setup.log
if [ -f ~/.vimrc ]
    then
        mv ~/.vimrc ~/.vimrc.old
        mv ./.vimrc ~
        echo "done" >> ~/ubuntu_setup.log
    else
        mv ./.vimrc ~
        echo "done" >> ~/ubuntu_setup.log
fi

###################
##Oh-My-Zsh Install
echo ">>Installing Oh-My-Zsh..." >> ~/ubuntu_setup.log
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
