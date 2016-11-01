#!/bin/bash

#############################################################
##Ian's Update and Installation Script for new ubuntu systems
##Use this grab all software I use and install it, making any
##needed changes and/or config files.

##########################################
##update repositories and upgrade software
echo ">>Update and Upgrade system..."
echo "[RUNNING] apt-get update"
sudo apt-get update;
echo "[RUNNING] apt-get upgrade"
sudo apt-get upgrade -qfy;
echo "[RUNNING] apt-get dist-upgrade"
sudo apt-get dist-upgrade -qfy;
echo "done"

#######################
##apt-get installations
echo ">>Installing new software..."
echo "[INSTALLING] open-vm-tools-*"
sudo apt-get -qq install -fy open-vm-tools-*    1> /dev/null
echo "[INSTALLING] gcc-multilib"
sudo apt-get -qq install -fy gcc-multilib       1> /dev/null
echo "[INSTALLING] g++-multilib"
sudo apt-get -qq install -fy g++-multilib       1> /dev/null
echo "[INSTALLING] wget"
sudo apt-get -qq install -fy wget               1> /dev/null
echo "[INSTALLING] curl"
sudo apt-get -qq install -fy curl               1> /dev/null
echo "[INSTALLING] zsh"
sudo apt-get -qq install -fy zsh                1> /dev/null
echo "[INSTALLING] tmux"                        
sudo apt-get -qq install -fy tmux               1> /dev/null   
echo "[INSTALLING] python"
sudo apt-get -qq install -fy python             1> /dev/null
echo "[INSTALLING] python3"
sudo apt-get -qq install -fy python3            1> /dev/null
echo "[INSTALLING] vim-runtime"
sudo apt-get -qq install -fy vim-runtime        1> /dev/null
echo "[INSTALLING] vim-gui-common"
sudo apt-get -qq install -fy vim-gui-common     1> /dev/null
echo "[INSTALLING] python2.7"
sudo apt-get -qq install -fy python2.7          1> /dev/null
echo "[INSTALLING] python2.7-dev"
sudo apt-get -qq install -fy python2.7-dev      1> /dev/null
echo "[INSTALLING] python-pip"
sudo apt-get -qq install -fy python-pip         1> /dev/null
echo "[INSTALLING] quassel-client"
sudo apt-get -qq install -fy quassel-client     1> /dev/null
echo "[INSTALLING] texlive"
sudo apt-get -qq install -fy texlive            1> /dev/null
echo "[INSTALLING] gnome"
sudo apt-get -qq install -fy gnome              1> /dev/null
echo "[INSTALLING] python-dev"
sudo apt-get -qq install -fy python-dev         1> /dev/null
echo "[INSTALLING] libssl-dev"
sudo apt-get -qq install -fy libssl-dev         1> /dev/null
echo "[INSTALLING] libffi-dev"
sudo apt-get -qq install -fy libffi-dev         1> /dev/null
echo "[INSTALLING] build-essential"
sudo apt-get -qq install -fy build-essential    1> /dev/null
echo "[INSTALLING] virtualenvwrapper"
sudo apt-get -qq install -fy virtualenvwrapper  1> /dev/null
echo "[INSTALLING] libqt4-dev"
sudo apt-get -qq install -fy libqt4-dev         1> /dev/null
echo "[INSTALLING] graphviz-dev"
sudo apt-get -qq install -fy graphviz-dev       1> /dev/null
echo "[INSTALLING] terminator"
sudo apt-get -qq install -fy terminator         1> /dev/null
echo "done"

########################################
##Attempt pip install of python-requests
echo ">>PIP>>Installing python requests..."
sudo pip install --upgrade requests 1> /dev/null
echo "done"

#################################
##Attempt pip install of pwntools
echo ">>PIP>>Installing pwntools..."
sudo -H pip install --upgrade pwntools 2> /dev/null
echo "done"

#################
##Radare2 Install
echo ">>Git Cloning radare2..."
cd ~
git clone https://github.com/radare/radare2.git
echo "done"
echo ">>Installing radare2..."
~/radare2/sys/install.sh
if [ -f '/usr/bin/radare2' ]
    then
        echo "[SUCCESS] Installed radare2"
    else
        echo "[!!FAIL!!] Problem installing radare2"
fi
echo "done"

##############
##Peda Install
echo ">>Installing peda..."
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "done"

#########################
##LaTeX download (vim-latex)
echo ">>Downloading and setting up vim-latex..."
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
        else
            echo "[!!FAIL!!] Something went wrong in vim-latex setup"
        fi
fi
echo "done"

################################
##.vimrc Setup and Configuration
echo ">>Setting up ~/.vimrc"
cd ~/ubuntu_setup
if [ -f ~/.vimrc ]
    then
        mv ~/.vimrc ~/.vimrc.old
        mv ./.vimrc ~
        echo "done"
    else
        mv ./.vimrc ~
        echo "done"
fi

###################
##Oh-My-Zsh Install
echo ">>Installing Oh-My-Zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
