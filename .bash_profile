#!/usr/local/bin bash

export PATH="$PATH:/usr/local:/usr:/Users/jonathanchong/Library/Android/sdk/platform-tools"
#export PS1="[\@] \e[92m\w\e[0m
#$ "
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\] $(git branch 2>/dev/null | grep "^*" | colrm 1 2)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '
export CLICOLOR=1

alias reload="source ~/.bash_profile"
alias cp="cp -i"
alias home="cd ~"
alias ll="pwd && ls -l"
alias npmls="npm ls -g --depth=0"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias school="cd ~/Documents/ucsc/winter_2019"
alias cd122="cd ~/Documents/ucsc/winter_2019/CMPS122"
alias vim="nvim"
alias vimconfig="vim ~/.vim/init.vim"
alias bashconfig="vim ~/.bash_profile"
alias grunhilda="ssh jocchong@grunhilda.soe.ucsc.edu"

