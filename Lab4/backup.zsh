#!/bin/zsh

now=$(date '+%F')
sourcePath="/Users/azamat/source/"
report="/Users/azamat/backup-report"
wasBackup=0
for directory in $(ls /Users/azamat/ | grep -E "^Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
    lastBackup=$(echo $directory | sed 's/^Backup-[0-9]{4}-[0-9]{2}-//')
    echo $lastBackup
    newBackup=$(echo $now | sed 's/[0-9]{4}-[0-9]{2}-//')
    difference=$newBackup-$lastBackup
    if [[ $difference < "7" ]] then
        wasBackup=1
    fi
done

if [[ $wasBackup == "0" ]] then
    backupDir="Backup-$now"
    mkdir /Users/azamat/$backupDir
    for file in $(ls -p $sourcePath | grep -hv "/")
    do
        backedUpFile=$(echo "/Users/azamat/$backupDir")
        fileToBackup=$(echo "$sourcePath$file")
        cp $fileToBackup $backedUpFile
    done
    echo "$backupDir was created on $now" >> $report
    ls /Users/azamat/$backupDir >> $report
else
    touch new.log
    touch change.log

    for file in $(ls -p $sourcePath | grep -hv "/")
    do
        old=$(ls /Users/azamat/$directory | grep -h "${file}" | wc -l)
        if [[ $old == "0" ]] then
            new=$(echo $(echo $sourcePath$file) | sed 's/\/source\//\/$directory\///')
            cp $(echo $sourcePath$file) $new
            echo $file >> new.log
        else
            wasBackedUp=$(echo "/Users/azamat/$directory/$file")
            cmp -s $fileToBackup $wasBackup ||
                {
                    newBackupFile=$(echo "$wasBackedUp.$now")
                    mv $wasBackedUp $newBackupFile
                    dir=$(echo "/Users/azamat/$directory")
                    cp $fileToBackup $dir
                    echo "$file" >> change.log
                    echo "$wasBackedUp -> $newBackupFile" | sed 's/\/Users\/azamat\/$directory\///' >> change.log
                }
        fi
    done

    echo "$directory has been updated on $now" >> $report
    echo "changed files: " >> $report
    cat change.log >> $report
    echo "new files: " >> $report
    cat new.log >> $report

    rm new.log
    rm change.log

fi
