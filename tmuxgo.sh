#!/bin/bash
################################################################################
# General structure and foundation from:
# tmuxgo - Dale Bewley <dale @ guifreelife org>
#-------------------------------------------------------------------------------
# Bugs & Todos:
#   o If session already exists, instantiate any missing windows.
#     This could be done by checking tmux list-windows, not sure needed.
#
#   o Window 0 automatically changes name to 'weechat 0.3.3', ignoring 
#     the -n option. The following should fix it, but does not:
#       tmux set-window-option -t $SESSION:0 automatic-rename off
#     Same thing happens when issuing configure command on Arista switches.
#     Note that name (#W) and title (#T) are not necessarily the same value.
################################################################################
 
# the name of your primary tmux session, defaults to current username
SESSION=$USER
 
# if the session is already running, just attach to it.
# send server not found errors to /dev/null
if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session $SESSION already exists. Attaching..."
    sleep 1
    tmux attach -t "$SESSION"
    exit 0;
fi
                 
# find the terminal's width and height so that splitting panes are sized properly
set -- $(stty size) # $1 = rows $2 = columns

# create a new detached session, named $SESSION
tmux -2 new-session -d -s "$SESSION" -x "$2" -y "$(($1-1))"

# Now populate the session with the windows you use every day
# 0 - VIM
tmux new-window  -t "$SESSION":0 -k -n VIM
tmux send-keys   -t "$SESSION":0 'cd /home/juice/juice38/' C-m
tmux send-keys   -t "$SESSION":0 'sudo vim .' C-m
tmux splitw      -v -l 5 -t 0
tmux select-pane -t 1
tmux send-keys   -t "$SESSION":0 'tail -f /home/juice/.log.error' C-m
tmux select-pane -t 0

# 1 - MySQL
tmux new-window -t "$SESSION":1 -k -n MySQL 'mysql -u root -p'

# 2 - Root Shell
tmux new-window -t "$SESSION":2 -k -n Shell 'sudo -s'

# 3 - ncmpcpp - COMING SOON, have to figure out how to attach to an mpd server over the web...and how to run mpd on a windows box...
# tmux new-window -t "$SESSION":2 -k -n Music 'ncmpcpp commands here'

# Select the starting window, and attach to the session
tmux select-window -t "$SESSION":0
tmux -2 attach -t "$SESSION"
