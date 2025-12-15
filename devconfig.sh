#!/bin/bash

os_name=$(uname -s)

# install tmux depending on os
case "$os_name" in
    Linux*)     sudo apt install tmux;;
    Darwin*)    brew install tmux;;
esac

# Clone my nvim config
git clone https://github.com/stojanovski-stefan/nvim.git ~/.config/nvim

# clone repo for tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# create tmux.conf config
echo "
unbind r
bind r source-file ~/.tmux.conf

# set leader to Ctrl + s
set -g prefix C-s
set -g mouse on

bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

set-option -g status-position top

set -g @catppuccin_window_status_style \"rounded\"
set -g status-left \"\"
set -g status-right \"#{E:@catppuccin_status_application} #{E:@catppuccin_status_session}\"
set -g status-style bg=default

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux'

# keep at bottom
run '~/.tmux/plugins/tpm/tpm'
" > ~/.tmux.conf

