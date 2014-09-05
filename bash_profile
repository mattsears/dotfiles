#!/bin/sh

source ~/.bash/colors
source ~/.bash/env
source ~/.bash/prompt
source ~/.bash/private
source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths

source ~/dotfiles/bin/terminal_tab_colors
source /Users/matt/.profile
source "`brew --prefix grc`/etc/grc.bashrc"

eval "$(rbenv init -)"
# set -o vi
eval "$(direnv hook bash)"
