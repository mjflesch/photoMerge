#!/bin/bash

# A shell script to do my photo sorting quickly
# Sort to Folders for Year and Month

# for loop over the files in the directory
for file in /home/matt/Pictures/test/*
do
    echo "Processing $file"
    # Use exiftool to extract date photo taken
    DATE=$(exiftool -s -f -CreateDate $file | awk '{print $3}')
    YEAR=$(echo $DATE | cut -c1-4)
    MONTH=$(echo $DATE | cut -c6-7)
    
    # Change directory to destination folders
    cd /home/matt/Pictures/output
    
    # Make Year sub-folder if it does not already exist
    mkdir -p $YEAR
    cd $YEAR
    
    # Make Month sub-folder if it does not already exist
    mkdir -p $MONTH
    cd $MONTH
    
    # Copy but don't overwrite existing file
    cp -n $file /home/matt/Pictures/output/$YEAR/$MONTH

done



