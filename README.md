# tilos-archiver

## version 1.2.3
- all scripts in scripts folder
- relative symlink
## version 1.2.2
- active link to version
- cron script runs in tilos-archiver folder

## version 1.2.1
- fix install script bugs
- add activate script

## version 1.2.0
- File name: `-digital-utc.mp3`
- online folder moved to `/tilos/online`
- install to version folder

## version 1.1.0
- File name: `-utc.mp3`
- Sym link with time zone Budapest 

## version 1.0.0
- startup for test

## Folders

Folder to download files `/home/arcjob/downloads`

Folder for applications `/home/arcjob/bin`

Folder for git repositories `/home/arcjob/source/github/tilosradio`

Folder for fmedia application `/home/arcjob/bin/fmedia-1`

Folder to store archived mp3 `/tilos/online/YYYY/MM/DD/`

utc mp3 file name `tilosradio-YYYYMMDD-HHmm-digital-utc.mp3`

symlink for mp3 file in timezone Budapest `tilosradio-YYYYMMDD-HHmm.mp3`

Folder to capture mp3 file `/home/arcjob/capture`

Example: 
`/tilos/online/2023/06/29/tilosradio-20230630-0800-digital-utc.mp3`
`/tilos/online/2023/06/29/tilosradio-20230830-0800.mp3 -> /tilos/online/2023/06/29/tilosradio-20230630-0800-digital-utc.mp3`

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
    mkdir -p ~/source/github/tilosradio
    mkdir -p ~/bin
    mkdir -p ~/capture
    mkdir -p ~/logs

## fmedia recorder
Install fmedia application from https://stsaz.github.io/fmedia/#download

    cd ~/downloads
    wget https://github.com/stsaz/fmedia/releases/download/v1.31/fmedia-1.31-linux-amd64.tar.xz
    tar Jxf ./fmedia-1.*-linux-amd64.tar.xz -C ~/bin
    ln -s ~/bin/fmedia-1/fmedia ~/bin/fmedia

or use install script

    cd ~/source/github/tilosradio/tilos-archiver
    . ./install-fmedia.sh

## git

Clone git repository:

    cd ~/source/github/tilosradio
    git clone https://github.com/tilosradio/tilos-archiver.git
    cd tilos-archiver

## install
Run install script

    cd ~/source/github/tilosradio/tilos-archiver
    . ./install.sh

## cron job
Add the job to contab from `cron.txt`
    
    crontab -e
    
