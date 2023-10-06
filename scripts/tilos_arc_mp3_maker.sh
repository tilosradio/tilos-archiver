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

FILENAME="tilosradio-digital-$YEAR$MOUNT$DAY-$HOUR$MINUTE-utc.mp3"
LINKNAME="tilosradio-$YEARBP$MOUNTBP$DAYBP-$HOURBP$MINUTEBP.mp3"
ONLINEPATH="/tilos/online/$YEAR/$MOUNT/$DAY"
LINKPATH="/tilos/online/$YEARBP/$MOUNTBP/$DAYBP"
CAPTUREPATH="$HOME/capture"
REMOTEPATH="tilos@archive.tilos.hu:/online/$YEAR/$MOUNT/$DAY"
STREAM="http://192.168.2.60:8080/digital"

FMEDIA="$HOME/bin/fmedia-1/fmedia"

DURATION=1801
if [ "$1" = "-d" ]; then 
    DURATION=$2
fi

SLEEPTIME=`expr 59 - \`date +%S\``
echo "waiting for the sec 59 ... sleep $SLEEPTIME"
sleep $SLEEPTIME

echo "make dir for the day $ONLINEPATH"
mkdir -p "$ONLINEPATH"
mkdir -p "$LINKPATH"

echo "Capture into $FILENAME"
"$FMEDIA" "$STREAM" -o "$CAPTUREPATH/$FILENAME" --stream-copy --until=$DURATION
echo "Move into $ONLINEPATH"
mv "$CAPTUREPATH/$FILENAME" "$ONLINEPATH/$FILENAME"
ln -s -r "$ONLINEPATH/$FILENAME" "$LINKPATH/$LINKNAME"
# remote copy to archiver storage
# sftp
echo sftp "$ONLINEPATH/$FILENAME" "$REMOTEPATH/$FILENAME"
date -u
df -h | grep disk_sg20t
echo "Done"
