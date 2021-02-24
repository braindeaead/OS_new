#!/bin/zsh

file="$PWD/$1"
newname="file$$"

if [[ $# != 1 ]] then
    echo "укажите 1 аргумент"
    exit 1
fi

if [[ ! -f $file ]] then
   echo "такого файла нет"
    exit 1
fi

if [[ ! -d /Users/azamat/.trash1 ]] then
    mkdir /Users/azamat/.trash1
    touch /Users/azamat/.trash.log
fi

ln "$file" "/Users/azamat/.trash1/${newname//://}"
echo "$file $newname" >> /Users/azamat/.trash.log
rm "$file"
