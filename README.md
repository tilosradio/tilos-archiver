# tilos-archiver

## version 1.3.2
- scp to internet
- clean up logs
- rename logs to job_YYYY*.log from cron_YYYY*.log

## version 1.2.5
- First release to capture digital stream to archive machine
- no ftp

## folders
- download files `/home/arcjob/downloads`
- applications `/home/arcjob/bin`
- git repositories `/home/arcjob/source/github/tilosradio`
- fmedia application `/home/arcjob/bin/fmedia-1`
- archived mp3 `/tilos/online/YYYY/MM/DD/`
- in the internet `archive@archive.tilos.hu:/home/tilos/archive/online/YEAR/MM/DD`
- capture mp3 file `/home/arcjob/capture`

## files
- digital capture timezone utc mp3 `tilosradio-digital-YYYYMMDD-HHmm-utc.mp3`
- symlink for mp3 file in timezone Budapest `tilosradio-YYYYMMDD-HHmm.mp3`

Example: 
    
    /tilos/online/2023/06/29/tilosradio-digital-20230629-0800-utc.mp3
    tilosradio-20230629-1000.mp3 -> tilosradio-digital-20230629-0800-utc.mp3

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

    mkdir -p $HOME/downloads
    mkdir -p $HOME/source/github/tilosradio
    mkdir -p $HOME/bin
    mkdir -p $HOME/capture
    mkdir -p $HOME/logs

## fmedia recorder
Install fmedia application from https://stsaz.github.io/fmedia/#download

    cd $HOME/downloads
    wget https://github.com/stsaz/fmedia/releases/download/v1.31/fmedia-1.31-linux-amd64.tar.xz
    tar Jxf ./fmedia-1.*-linux-amd64.tar.xz -C $HOME/bin
    ln -s $HOME/bin/fmedia-1/fmedia $HOME/bin/fmedia

or use install script

    cd $HOME/source/github/tilosradio/tilos-archiver
    . scripts/install-fmedia.sh

## git

Clone git repository:

    git clone https://github.com/tilosradio/tilos-archiver.git $HOME/source/github/tilosradio/tilos-archiver

## Install
Run install script

    cd $HOME/source/github/tilosradio/tilos-archiver/scripts
    . ./install.sh

## cron job
Add the job to contab from `cron.txt`
    
    crontab -e
    
## scp
Create ssh keys for scp. Generate ssh key in archiver of studio and add the public key into the  authorized_keys of the archiver in the internet.

    mkdir /home/arcjob/.ssh
    ssh-keygen -f /home/arcjob/.ssh/id_arcjob_studio
    ssh-copy-id -i /home/arcjob/.ssh/id_arcjob_studio archive@archive.tilos.hu
    # cat id_arcjob_studio.pub > archive@archive.tilos.hu:/home/archive/.ssh/authorized_keys

## archive.tilos.hu
Store mp3 files for users on the internet to listening online the archived broadcasts.
    
    /home/tilos/archive/online/YEAR/MM/DD

