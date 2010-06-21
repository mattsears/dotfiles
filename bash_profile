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


if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# if the dircolors utility is available, set that up to
	dircolors="$(type -P gdircolors dircolors | head -1)"
	test -n "$dircolors" && {
	    COLORS=/etc/DIR_COLORS
	    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
	    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
	    test ! -e "$COLORS"               && COLORS=
	    eval `$dircolors --sh $COLORS`
    }
unset dircolors
