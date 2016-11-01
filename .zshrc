# Path to your oh-my-zsh installation.
export ZSH=/home/nullp0inter/.oh-my-zsh
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gallifrey"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.aliases
unsetopt nomatch
source /usr/local/bin/virtualenvwrapper.sh
export NDK_DIR='/home/nullp0inter/Documents/Github/android/android-ndk-r13'
export SDK_DIR='/home/nullp0inter/Android/Sdk'
