#!/bin/bash

log_dir="/tmp/udhaya/access"

for file in "$log_dir"/access_*; do
    if [[ -f $file && $file != *.gz ]]; then
        file_name=$(echo "$(basename ${file})")

        #To extract the date from file name
        extracted_date=$(echo "$file_name" | awk -F'[_.]' '{print $2 "-" $3}')

        #To convert the extracted date to Required format(from 2024-12-24-04-16 to 2024-12-24 04:16)
        formatted_date=$(echo "$extracted_date" | sed -E 's/^([0-9]{4}-[0-9]{2}-[0-9]{2})-([0-9]{2})-([0-9]{2})/\1 \2:\3/')

        #To get seconds from formatted_date
        timestamp=$(date -d "$(echo "$formatted_date" | sed -E 's/^([0-9]{4}-[0-9]{2}-[0-9]{2})-([0-9]{2})-([0-9]{2})/\1 \2:\3/')" +%s)

        #To get the current date in seconds
        currenttime=$(date +%s)

        diff_seconds=$(($currenttime - $timestamp))

        diff_hours=$(($diff_seconds / 3600))

        
        if  [[ $diff_hours -gt 12 ]]; then
            echo "$file_name - $diff_hours" 
            gzip -v "$file"
        fi
    fi
done
