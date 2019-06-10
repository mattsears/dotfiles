#!/bin/sh

source ~/.bash/colors
source ~/.bash/env
source ~/.bash/prompt
source ~/.bash/private
source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths

source /Users/matt/.profile

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
eval "$(thefuck --alias)"

# OPAM configuration
. /Users/matt/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH="$HOME/.cargo/bin:$PATH"
