#!/bin/sh

# single almanch download

ALMFN="e.txt"
TEMP="/tmp";

    DAY=`date -u +%j`
    YEAR=`date -u +%y`
    echo day:$DAY year:$YEAR
    FN=brdc`echo -n $DAY`0.`echo -n $YEAR`n
    FNU=BRDC`echo -n $DAY`0.`echo -n $YEAR`n
    PD=$PWD
    cd $TEMP
    rm -f $TEMP/$FN

    wget ftp://www.ngs.noaa.gov/cors/rinex/20$YEAR/$DAY/$FN.gz
#    wget ftp://alt.ngs.noaa.gov/cors/rinex/20$YEAR/$DAY/$FN.gz
    if [ -s $TEMP/$FN.gz ] ; then
      echo noaa ok
      gunzip $TEMP/$FN.gz
    fi
    cd $PD 
    if [ -s $TEMP/$FN ] ; then
      mv $TEMP/$FN $TEMP/$ALMFN
    else 
      echo download failed
    fi