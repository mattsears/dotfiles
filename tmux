# ACT like vim
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
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
set -g status-fg 'blue'

# remove administrative debris (session name, hostname, time) in status bar
set -g status-left ''
set -g status-right ''

# increase scrollback lines
set -g history-limit 10000

bind l select-pane -R

# improve colors
set -g default-terminal 'screen-256color'

# Local config
if-shell "[ -f ~/.tmux.conf.local ]" 'source ~/.tmux.conf.local'

set-environment -gu RBENV_VERSION
set-environment -gu RBENV_DIR
set-environment -gu RBENV_GEMSET_ALREADY
set-environment -gu RBENV_HOOK_PATH
set-environment -gu RBENV_ROOT
set-environment -gu RBENV_VERSION
