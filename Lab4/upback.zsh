#!/bin/zsh

mkdir -p /Users/azamat/restore
backupDate=" "
last=0

for directory in $(ls /Users/azamat/ | grep -E "^Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
    date=$(echo $sdirectory | sed 's/^Backup-//')
    days=$(echo $backupDate | sed 's/[0-9]{4}-[0-9]{2}-//')
    if [[ $last == "0" ]] then
        last=$days
        backupDate=$date
    fi
    if [[ $last > $days ]] then
        last=$days
        backupDate=$date
    fi
done

from="/Users/azamat/Backup-$backupDate/"
to="/Users/azamat/restore/"

for file in $(ls $from | grep -hv "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
    cp $from$file $to
done
