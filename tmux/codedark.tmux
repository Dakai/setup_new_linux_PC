#!/usr/bin/env bash
# TokyoNight colors for Tmux

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
#[fg=#2d2b40,bg=#62f2f1] #S \
#[fg=#62f2f1,bg=#2d2b40,bold,nounderscore,noitalics]"

set -g status-right "\
#[fg=#cbd3d4,bg=#2d2b40,nobold,nounderscore,noitalics] \
CPU: #{cpu_percentage}  \
MEM: #{ram_percentage} \
#[fg=#62f2f1,bg=#2d2b40]\
#[fg=#2d2b40,bg=#62f2f1] %m-%d  %H:%M \
#[fg=#2d2b40,bg=#62f2f1,nobold,nounderscore,noitalics]\
#[fg=#2d2b40,bg=#62f2f1] #{public_ip} #[fg=#62f2f1,fg=#569cd6]\
#[fg=#2d2b40,bg=#569cd6]  #h "
setw -g window-status-format "\
#[fg=#cbd3d4,bg=#2d2b40] #I \
#[fg=#cbd3d4,bg=#2d2b40] #W "

setw -g window-status-current-format "\
#[fg=#2d2b40,bg=#569cd6,nobold,nounderscore,noitalics]\
#[fg=#2d2b40,bg=#569cd6] #I \
#[fg=#2d2b40,bg=#569cd6] #W \
#[fg=#569cd6,bg=#2d2b40,nobold,nounderscore,noitalics]"
