tmux
--------
Reference:
```
https://gist.github.com/ryerh/14b7c24dfd623ef8edc7
```

#### Tmux basic notions
1. Session. 
   when exec "tmux", a session will be created.
2. Window. 
   One session contains mutiple windows.
3. Pane.
   One window contains mutilple panes.
   one panes is one terminal shell.


#### Tmux commands
```
# create a new session or a new window
tmux new -s [seesionn name] -n [window name]

# recover session
tmux at [-t session_name]

# list all sessions
tmux ls

# continue to use session 0
tmux attach -t 0

# kill session
tmux kill-session -t session-name

# kill all sessions
tmux kill-server

```

#### Tmux Configuration
Base setting in ~/.tmux.conf
```
# use C-x instead C-b to motivate tmux command mode.
set -g prefix C-x 

# disable key C-b.
unbind C-b  

# mouse can slide up and down to check tmux history coommands.
set -g mouse on 

```


Mapping keys in ~/.tmux.conf
```
# so we can split window vertical.
bind \\ split-window -h # means C-x+\ intead C-z+% to create a vertical pane. 

# so we can split window horizontal.
bind - split-window -v 

# switch to the pane on the left.
bind h select-pane -L 

# switch to the pane on the below.
bind j select-pane -D  

# switch to the pane on the above.
bind k select-pane -U 

# switch to the pane on the right.
bind l select-pane -R 
```

Default keys about panes. <prefix> means your prefix
tmux default prefix is C-b. I changed it to C-z.
```
# Split window vertical with an new pane.
<prefix>\

# Split windoww horizonal with an new pane.
<prefix>-

# Clockwise choose pane in window
<prefix>o  

# Change the layout of the window
<prefix>space

# Kill current pane
<prefix>x

# Extract the current pane from current window, 
# and beacome a alone window.
# other panes will disappear or lost.
<prefix>!

```
Default keys about window.
```
# Create a new window under a session
<prefix>c

# Visualize the sessions
<prefix>w

# Switch to next window under the same session.
<prefix>n

# Switch to previous window under the same session.
<prefix>p

# Switch to <n> window under the same session. 
# <n> means windows numser.
<prefix><n>

# Close the current window.
<prefix>&

```

Default keys about session.
```
# Rename session
<prefix>$

# Detach Session, leave tmux env.
<prefix>d
<prefix><prefix>

# Visualize the sessions.
<prefix>s

# Switch to next session.
<prefix>)

# Switch to previous session.
<prefix>(

# Switcht to the last using session.
<prefix>L

```
Other commands
```
# Search word in window
<prefix>f
```

