# disable the repeat time for tmux
set -g repeat-time 0

# enable mouse controls
set -g mouse-select-pane on
set -g mouse-select-window on
set -g mouse-resize-pane on
setw -g mode-mouse on

# change the text for the status line of tmux
set -g status-bg black
set -g status-fg white
set -g status-left '#[fg=green]#H'
set -g status-right '#[fg=yellow]#(uptime | cut -d "," -f 2-)'
