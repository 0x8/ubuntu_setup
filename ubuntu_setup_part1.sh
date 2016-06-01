#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.
touch ~/ubuntu_setup.log

##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..."
echo ">>Update and Upgrade system..." >> ~/ubuntu_setup.log
sudo apt-get -qq update 1> /dev/null;
sudo apt-get -qq upgrade -qfy 1> /dev/null;
sudo apt-get -qq dist-upgrade -qfy 1> /dev/null;
echo "done"
echo "done" >> ~/ubuntu_setup.log

#######################
##apt-get installations
echo ">>Installing new software..." >> ~/ubuntu_setup.log
echo "[INSTALLING] open-vm-tools-*"
echo "[INSTALLING] open-vm-tools-*" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy open-vm-tools-*    1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] gcc-multilib"
echo "[INSTALLING] gcc-multilib" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy gcc-multilib       1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] g++-multilib"
echo "[INSTALLING] g++-multilib" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy g++-multilib       1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] thefuck"
echo "[INSTALLING] thefuck" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy thefuck            1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] wget"
echo "[INSTALLING] wget" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy wget               1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] curl"
echo "[INSTALLING] curl" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy curl               1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] zsh"
echo "[INSTALLING] zsh" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy zsh                1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] python"
echo "[INSTALLING] python" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy python             1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] python3"
echo "[INSTALLING] python3" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy python3            1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log
echo "[INSTALLING] vim-runtime"
echo "[INSTALLING] vim-runtime" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy vim-runtime        1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] vim-gui-common"
echo "[INSTALLING] vim-gui-common" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy vim-gui-common     1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] python2.7"
echo "[INSTALLING] python2.7" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy python2.7          1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] python2.7-dev"
echo "[INSTALLING] python2.7-dev" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy python2.7-dev      1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] python-pip"
echo "[INSTALLING] python-pip" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy python-pip         1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] quassel-client"
echo "[INSTALLING] quassel-client" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy quassel-client     1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] texlive-full"
echo "[INSTALLING] texlive-full" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy texlive-full        1> /dev/null
echo "done"
echo "done"
echo "[INSTALLING] cinnamon"
echo "[INSTALLING] cinnamon" >> ~/ubuntu_setup.log
sudo apt-get -qq install -fy cinnamon           1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log

########################################
##Attempt pip install of python-requests
echo ">>PIP>>Installing python requests..."
echo ">>PIP>>Installing python requests..." >> ~/ubuntu_setup.log
sudo pip install requests 1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log

#################################
##Attempt pip install of pwntools
echo ">>PIP>>Installing pwntools..."
echo ">>PIP>>Installing pwntools..." >> ~/ubuntu_setup.log
sudo -H pip install pwntools 1> /dev/null
echo "done"
echo "done" >> ~/ubuntu_setup.log

#################
##Radare2 Install
echo ">>Git Cloning radare2..." >>
echo ">>Git CLoning radare2..." >> ~/ubuntu_setup.log
cd ~
git clone https://github.com/radare/radare2.git
echo "done"
echo "done" >> ~/ubuntu_setup.log

echo ">>Installing radare2..." >> ~/ubuntu_setup.log
./sys/install.sh
if [ -f '/usr/bin/radare2' ]
    then
        echo "[SUCCESS] Installed radare2"
        echo "[SUCCESS] Installed radare2" >> ~/ubuntu_setup.log
    else
        echo "[!!FAIL!!] Problem installing radare2"
        echo "[!!FAIL!!] Problem installing radare2" >> ~/ubuntu_setup.log
fi
echo "done"
echo "done" >> ~/ubuntu_setup.log

##############
##Peda Install
echo ">>Installing peda..."
echo ">>Installing peda..." >> ~/ubuntu_setup.log
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "done"
echo "done" >> ~/ubuntu_setup.log

#########################################
##Install Scud-Cloud, ubuntu slack client
echo ">>Installing scudcloud"
echo ">>Installing scudcloud" >> ~/ubuntu_setup.log
sudo apt-add-repository -y ppa:rael-gc/scudcloud 1> /dev/null
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections 1> /dev/null
sudo apt-get update 1> /dev/null
sudo apt-get install scudcloud 1> /dev/null
if [ -f '/usr/bin/scudcloud' ]
    then
        echo "[SUCCESS] Installed scudcloud"
        echo "[SUCCESS] Installed scudcloud" >> ~/ubuntu_setup.log
    else
        echo "[!!FAIL!!] Problem installing scudcloud"
        echo "[!!FAIL!!] Problem installing scudcloud" >> ~/ubuntu_setup.log
fi
echo "done"
echo "done" >> ~/ubuntu_setup.log

#########################
##LaTeX download (vim-latex)
echo ">>Downloading and setting up vim-latex..."
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
                echo "[SUCCESS] Vim-latex setup successful"
                echo "[SUCCESS] Vim-latex setup successful" >> ~/ubuntu_setup.log
        else
            echo "[!!FAIL!!] Something went wrong in vim-latex setup"
            echo "[!!FAIL!!] Something went wrong in vim-latex setup" >> ~/ubuntu_setup.log
        fi
fi
echo "done"
echo "done" >> ~/ubuntu_setup.log

################################
##.vimrc Setup and Configuration
echo ">>Settomg up ~/.vimrc"
echo ">>Setting up ~/.vimrc" >> ~/ubuntu_setup.log
if [ -f ~/.vimrc ]
    then
        mv ~/.vimrc ~/.vimrc.old
        mv ./.vimrc ~
        echo "done"
        echo "done" >> ~/ubuntu_setup.log
    else
        mv ./.vimrc ~
        echo "done"
        echo "done" >> ~/ubuntu_setup.log
fi

###################
##Oh-My-Zsh Install
echo ">>Installing Oh-My-Zsh..."
echo ">>Installing Oh-My-Zsh..." >> ~/ubuntu_setup.log
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
