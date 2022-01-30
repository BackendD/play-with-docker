#!/bin/sh

apk add tmux tree git p7zip rclone;
mkdir -p ~/cargo;
touch ~/cargo/y.txt;
chmod o+w ~/cargo;
sed -i '/cat \/etc\/motd/d' ~/.profile;
echo 'alias c=clear' >> ~/.profile;
echo 'alias y="yt-dlp -f \"bestvideo[height<=1080p]+bestaudio\" --write-auto-sub --write-sub --sub-lang en -a y.txt"' >> ~/.profile;
## https://hub.docker.com/r/tnk4on/yt-dlp
echo "alias yt-dlp='docker run --rm -it -v ~/cargo:/media:rw tnk4on/yt-dlp'" >> ~/.profile;

git clone https://gitlab.com/BackendD/play-with-docker.git ~/play-with-docker;

~/play-with-docker/general-tmux.sh;

clear;