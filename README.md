# Play With Docker

Initiate the container for:

- Browsing files
- Runnig torrents
- Downloading from yotube and other media

## Execute

Run the following command in the terminal:

```sh
curl -sLf https://pwd.gitme.cf/init.sh | bash; tmux a;
```

## What is done?

### Running a file browser server:

Using [this docker image](https://hub.docker.com/r/filebrowser/filebrowser). The port number is: **80**.

### Running a qBittorrent Client:

Using [this docker image](https://hub.docker.com/r/wernight/qbittorrent). The web UI port number is: **8080**.

### Alias a youtube downloader command:

You can use `yt-dlp` to download media, for example:

```sh
## Alias of the following command is: 'y'
yt-dlp -f 'bestvideo[height<=1080p]+bestaudio' --write-auto-sub --write-sub --sub-lang en -a y.txt
```

Download items from a playlist

```sh
yt-dlp -f 'bestvideo[height<=1080p]+bestaudio' --write-auto-sub --write-sub --sub-lang en -a y.txt --playlis-items 15,16,17
```

Download mp3:

```sh
yt-dlp -f 'bestaudio' -x --audio-format mp3 -a y.txt
```

## Compress

Use ***p7zip*** to pack and encrypt the files or directory, with the following switches:

- **a**: Add
- **-p**: Password = passw0rd
- **-mhe**: 7z format only : enables or disables archive header encryption (Default : off) = on

```bash
7z a -ppassw0rd -mhe=on -v600m crack.7z target-file-or-directory
mv crack.7z crack.exe
rm -rf target-file-or-directory
```