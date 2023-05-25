set -x
cd ~/downloads
wget https://github.com/stsaz/fmedia/releases/download/v1.31/fmedia-1.31-linux-amd64.tar.xz
tar Jxf ./fmedia-1.*-linux-amd64.tar.xz -C ~/bin
ln -s ~/bin/fmedia-1/fmedia ~/bin/fmedia
