#!/usr/bin/env bash

# Rename the main window
tmux rename-window editor
tmux send-keys "nvim +Telescope smart_open" Enter

# Create the support window
tmux new-window -n support

# Create the notes window
tmux new-window -n notes
tmux send-keys "worklog.sh" Enter
