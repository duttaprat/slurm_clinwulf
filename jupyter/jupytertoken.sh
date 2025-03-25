#!/bin/bash


if [[ $1 =~ ^-?[0-9]+$ ]]; then
    mylogfile="jupyter-notebook-$1.log"
else
    mylogfile=$1
fi


#myret=`cat $mylogfile |grep 127.0.0.1|grep Note|awk -F'/.token=|127.0.0.1:' '{print $2  "," $3}'`

myret=`cat $mylogfile  |grep 'NotebookApp] http'|awk -F'/.token=|http://' '{print $2 ":"$3}'`


IFS=: read -r mynode myport mytoken <<< "$myret"

myuser=$(whoami)

echo
echo "Command to create ssh tunnel or new session for : $myuser

ssh -N -f -L $myport:$mynode:$myport $myuser@login01.uhmc.sbuh.stonybrook.edu"

echo
echo "Then open: http://localhost:$myport"
echo
echo "Use this token:"
echo $mytoken



