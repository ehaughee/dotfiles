#!/bin/bash
################################################################################
# tmuxgo - Dale Bewley <dale @ guifreelife org> - Sat Feb 19 08:53:30 PST 2011
#-------------------------------------------------------------------------------
# Use me to get your tmux session restored after a reboot or reattach daily.
# Just type tmuxgo every morning and hit ^bd at the end of the day. Login
# remotely and do the same.
#
# Attaches to an existing session named $SESSION or will create one if missing.
# The created session will be pre-populated with a number of windows. 
#
# For example, window 0 running IRC, window 1 running email, window 2 logged
# into a router used daily.
#
#
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
 
# the name of your primary tmux session
SESSION=$USER
 
# if the session is already running, just attach to it.

if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo "Session $SESSION already exists. Attaching..."
    sleep 1
    tmux -2 attach -t "$SESSION"
    exit 0;
fi
                 
# create a new session, named $SESSION, and detach from it
set -- $(stty size) # $1 = rows $2 = columns
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

# 2 - Shell
tmux new-window -t "$SESSION":2 -k -n Shell 'sudo -s'

# all done. select starting window and get to work
# you may need to cycle through windows and type in passwords
# if you don't use ssh keys
tmux select-window -t "$SESSION":0
tmux -2 attach -t "$SESSION"
