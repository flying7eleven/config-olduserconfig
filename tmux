# act like vim
setw -g mode-keys vi
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+

# act like GNU screen
unbind C-b
set -g prefix C-a

# look good
set -g default-terminal "xterm-256color"
