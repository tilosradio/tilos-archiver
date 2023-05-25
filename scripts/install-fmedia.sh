set -x
mkdir -p "$HOME/downloads"
cd "$HOME/downloads"
wget https://github.com/stsaz/fmedia/releases/download/v1.31/fmedia-1.31-linux-amd64.tar.xz
tar Jxf ./fmedia-1.*-linux-amd64.tar.xz -C "$HOME/bin"
ln -s -r "$HOME/bin/fmedia-1/fmedia" "$HOME/bin/fmedia"
set +x
