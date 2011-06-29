source ~/.bash/env
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

source /Users/matt/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
