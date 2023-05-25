# tilos-archiver

version 1.0.0

## Folders

Folder to download files `/home/arcjob/downloads`

Folder for applications `/home/arcjob/bin`

Folder for git repositories `/home/arcjob/github/tilosradio`

Folder for fmedia application `/home/arcjob/bin/fmedia-1`

Folder to store archived mp3 `/online/YYYY/MM/DD/`

mp3 file name `tilosradio-YYYYMMDD-HHmm.mp3`

Folder to capture mp3 file `/home/arcjob/capture`

Example `/online/2023/06/29/tilosradio-20230629-0800.mp3`

## user
Add rights for online folder

    sudo addgroup tilos
    sudo chgrp -R tilos /online
    # sudo chmod -R g+rwx /online
    # ??? sudo setfacl -R -d -m u::rwX -m g::rwX /online

Create a new user in the linux server for archiver jobs `arcjob` Keep the password safe

    sudo adduser arcjob
    sudo usermod -g tilos arcjob

Create folders in arcjob home folder as arcjob user

    mkdir -p ~/downloads
    mkdir -p ~/bin
    mkdir -p ~/capture
    mkdir -p ~/logs
    mkdir -p ~/github/tilosradio

## fmedia recorder
Install fmedia application from https://stsaz.github.io/fmedia/#download

    cd ~/downloads
    wget https://github.com/stsaz/fmedia/releases/download/v1.31/fmedia-1.31-linux-amd64.tar.xz
    tar Jxf ./fmedia-1.*-linux-amd64.tar.xz -C ~/bin
    ln -s ~/bin/fmedia-1/fmedia ~/bin/fmedia

or use install script

    cd ~/github/tilosradio/tilos-archiver
    . ./install-fmedia.sh

## git

Clone git repository:

    cd ~/github/tilosradio
    git clone https://github.com/tilosradio/tilos-archiver.git
    cd tilos-archiver

## install
Run install script

    cd ~/github/tilosradio/tilos-archiver
    . ./install.sh

## cron job
Add the job to contab
    
    crontab -e
    
