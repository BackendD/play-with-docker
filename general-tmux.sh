#!/bin/sh

session="General"

# Check session exists
tmux has-session -t $session 2>/dev/null;

# If session not exists
if [ $? != 0 ]; then
    
# Create session
    tmux new -d -s $session;
    
# Layer Window
# ---------------------
# |         |         |
# |    0    |    1    |
# |         |         |
# |         |         |
# ---------------------
    tmux splitw -h -t General:0;

# Execute mtr in pane 0
    tmux send-keys -t General:0.0 'docker run \
        --rm -it \
        --user $UID:$GID \
        -p 80:80 \
        -v ~:/srv \
        -v ~/play-with-docker/filebrowser/filebrowser.json:/.filebrowser.json \
        -v ~/play-with-docker/filebrowser/database.db:/database.db \
        filebrowser/filebrowser' Enter

# Execute mtr in pane 1
    tmux send-keys -t General:0.1 'docker run \
        --rm -it \
        --user $UID:$GID \
        -p 8080:8080 -p 6881:6881/tcp -p 6881:6881/udp \
        -v ~/play-with-docker/qbittorrent:/config \
        -v ~/cargo:/downloads \
        wernight/qbittorrent' Enter
fi
