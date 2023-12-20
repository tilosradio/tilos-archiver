#!/bin/sh
# set -x
echo "$0"
echo "PID: $$"
date -u
date -u -d "1 min"
df -h | grep disk_sg20t

YEAR=`date -u -d "1 min" +"%Y"`
MOUNT=`date -u -d "1 min" +"%m"`
DAY=`date -u -d "1 min" +"%d"`
HOUR=`date -u -d "1 min" +"%H"`
MINUTE=`date -u -d "1 min" +"%M"`

YEARBP=`date -d "TZ=\"Budapest/Budapest\" 1 min" +"%Y"`
MOUNTBP=`date -d "TZ=\"Budapest/Budapest\" 1 min" +"%m"`
DAYBP=`date -d "TZ=\"Budapest/Budapest\" 1 min" +"%d"`
HOURBP=`date -d "TZ=\"Budapest/Budapest\" 1 min" +"%H"`
MINUTEBP=`date -d "TZ=\"Budapest/Budapest\" 1 min" +"%M"`

FILEPATH="/tilos/online/$YEAR/$MOUNT/$DAY"
FILENAME="tilosradio-digital-$YEAR$MOUNT$DAY-$HOUR$MINUTE-utc.mp3"

LINKPATH="/tilos/online/$YEARBP/$MOUNTBP/$DAYBP"
LINKNAME="tilosradio-$YEARBP$MOUNTBP$DAYBP-$HOURBP$MINUTEBP.mp3"

REMOTEURL="archive@archive.tilos.hu"
REMOTEPATH="/home/tilos/archive/online/$YEARBP/$MOUNTBP/$DAYBP"
REMOTENAME="tilosradio-$YEARBP$MOUNTBP$DAYBP-$HOURBP$MINUTEBP-test.mp3"

CAPTUREPATH="$HOME/capture"

STREAM="http://192.168.2.60:8080/digital"

FMEDIA="$HOME/bin/fmedia-1/fmedia"

DURATION=1801
if [ "$1" = "-d" ]; then 
    DURATION=$2
fi

SLEEPTIME=`expr 59 - \`date +%S\``
echo "waiting for the sec 59 ... sleep $SLEEPTIME"
sleep $SLEEPTIME

echo "make dir for the day $FILEPATH"
mkdir -p "$FILEPATH"
mkdir -p "$LINKPATH"

echo "Capture into $FILENAME"
"$FMEDIA" "$STREAM" -o "$CAPTUREPATH/$FILENAME" --stream-copy --until=$DURATION
echo "Move into $FILEPATH"
mv "$CAPTUREPATH/$FILENAME" "$FILEPATH/$FILENAME"
ln -s -r "$FILEPATH/$FILENAME" "$LINKPATH/$LINKNAME"
# remote copy to archiver storage
echo "make dir on remote $REMOTEURL:$REMOTEPATH"
ssh -p 2222 -i $HOME/.ssh/id_arcjob_studio $REMOTEURL "mkdir -p $REMOTEPATH"
echo "scp $LINKPATH/$LINKNAME $REMOTEURL:$REMOTEPATH/$REMOTENAME"
scp -B -p -P 2222 -i $HOME/.ssh/id_arcjob_studio "$LINKPATH/$LINKNAME" "$REMOTEURL:$REMOTEPATH/$REMOTENAME"
ssh -p 2222 -i $HOME/.ssh/id_arcjob_studio $REMOTEURL "ls -l $REMOTEPATH/$REMOTENAME"
echo "scp done"
date -u
df -h | grep disk_sg20t
echo "Done"
