#!/bin/bash

if [[ $1 =~ ^-?[0-9]+$ ]]; then
    mylogfile="jupyterlab-$1.log"
else
    mylogfile=$1
fi

# Extract the first URL printed by Jupyter (e.g., "compute014:9478/lab")
jupyter_url=$(grep -oP 'http://\K[^ ]+' "$mylogfile" | head -n 1)

# Remove the trailing "/lab" from the URL if it exists
clean_url=$(echo "$jupyter_url" | sed 's/\/lab//')

# Extract the node name and port from the cleaned URL
mynode=$(echo "$clean_url" | cut -d':' -f1)
myport=$(echo "$clean_url" | cut -d':' -f2)

# Try to extract a token if one is printed
mytoken=$(grep -oP 'token=\K\S+' "$mylogfile" | head -n 1)

myuser=$(whoami)

echo
echo "Command to create ssh tunnel or new session for: $myuser"
echo
echo "ssh -N -L $myport:$mynode:$myport $myuser@login01.uhmc.sbuh.stonybrook.edu"
echo
echo "Then open: http://localhost:$myport/lab"
echo
if [ -z "$mytoken" ]; then
    echo "Password is enabled. Please use your Jupyter Lab password to log in."
else
    echo "Use this token:"
    echo "$mytoken"
fi
