#!/bin/sh

source ~/.bash/colors
source ~/.bash/env
source ~/.bash/config
source ~/.bash/private
source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

source /Users/matt/.profile

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"
