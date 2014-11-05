# Don't wait for an escape sequence for hitting Esc
set -sg escape-time 0

# Use vim keybindings in copy mode
setw -g mode-keys vi

set-option -g terminal-overrides '*88col*:colors=88,*256col*:colors=256,xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007:Cs=\E]12;%p1%s\007:Cr=\E]112\007:Ss=\E]50;CursorShape=%?%p1%{3}%<%t%{0}%e%p1%{2}%-%;%d\007'

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind z send-keys -R \; clear-history

bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+
bind-key T swap-window -t 0

# reloads tmux config
bind-key r source-file ~/.tmux.conf

# act like GNU screen
unbind C-b
set -g prefix C-a

# start window numbers at 1 to match keyboard order with tmux window order
set -g base-index 1

# renumber windows sequentially after closing any of them
set -g renumber-windows on

# soften status bar color from harsh green to light gray
set -g status-bg '#222222'
set -g status-fg '#c397d8'

# remove administrative debris (session name, hostname, time) in status bar
set -g status-left ''
set -g status-right ''

# increase scrollback lines
set -g history-limit 10000

# improve colors
set -g default-terminal 'screen-256color'

# Local config
if-shell "[ -f ~/.tmux.conf.local ]" 'source ~/.tmux.conf.local'

unbind %
unbind '"'
bind | split-window -h
bind - split-window -v
bind N previous-window

set -g default-command "reattach-to-user-namespace -l bash"

# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

set-environment -gu RBENV_VERSION
set-environment -gu RBENV_DIR
set-environment -gu RBENV_GEMSET_ALREADY
set-environment -gu RBENV_HOOK_PATH
set-environment -gu RBENV_ROOT
set-environment -gu RBENV_VERSION
