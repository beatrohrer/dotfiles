# Oh-My-Zsh #
#############

# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="fishy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git brew colored-man node npm osx rvm sublime autojump)
plugins=(git brew colored-man osx sublime)

source $ZSH/oh-my-zsh.sh

# Custom #
##########

export VISUAL=vim
export EDITOR="$VISUAL"

alias checkssl='nmap --script ssl-cert,ssl-enum-ciphers -p 443'
alias ll='ls -lah'
alias a2restart='/etc/init.d/apache2 restart'
alias a2reload='/etc/init.d/apache2 reload'
 
# NTP
alias ntpforceupdate='service ntp stop && ntpd -gq && service ntp start'

# Git
export GIT_AUTHOR_NAME="Beat Rohrer"
export GIT_AUTHOR_EMAIL="beat.rohrer@zhdk.ch"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

# gnb = git new branch
# create new git branch and push to origin
gnb() { git checkout -b "$@" && git push --set-upstream origin "$@" }
alias glb='git for-each-ref --sort=-committerdate refs/heads/ | head | sed "s/.*refs\/heads\///g"'

# Git puLl All
gla() {
  git pull "$@" && git submodule update --init --recursive
}

# Typo3 6.2
alias cleartypocache='rm -r typo3temp/Cache/*; rm typo3temp/locks/*'
export PATH=$PATH:/usr/local/share/npm/bin:/opt/X11/bin

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# source cdargs config
source ~/dotfiles/scripts/cdargs-bash.sh

# source iTerm2 shell integration
source ~/dotfiles/iterm2_shell_integration.zsh

# source extra config
FILE=~/.zshrc_aux
if [ -f $FILE ]; then
  source $FILE
fi
