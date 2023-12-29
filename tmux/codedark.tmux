# This tmux statusbar config was created by tmuxline.vim
# on Sun, 07 May 2023

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#2d2b40,bg=#569cd6"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#62f2f1"
set -g status-style "none,bg=#2d2b40"
set -g message-style "fg=#2d2b40,bg=#569cd6"
set -g pane-border-style "fg=#569cd6"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#cbd3d4,bg=#2d2b40"
set -g status-left "\
set -g status-right "\
CPU: #{cpu_percentage}  \
MEM: #{ram_percentage} \
setw -g window-status-format "\
setw -g window-status-current-format "\

