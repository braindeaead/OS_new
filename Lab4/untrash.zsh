#!/bin/zsh

file="$1"

if [[ $# != 1 ]] then
    echo "нужен 1 аргумент"
    exit 1
fi

if [[ "echo $file | sed 's/[a-z,0-9,-]*//'" == "" ]] then
    echo "неправильные символы в имени файла"
    exit 1
fi

grep $file /Users/azamat/.trash.log |
    while read line; do
        filename=$(echo $line | cut -d " " -f 1)
        lnname=$(echo $line | cut -d " " -f 2)
        echo "если хотите восстановить $filename введите Y, иначе N"
        read answer </dev/tty
        case "$answer" in
            "Y")
                $(ln "/Users/azamat/.trash1/$lnname" "$filename")
                rm /Users/azamat/.trash1/$lnname
                echo "восстановлено $file"
                ;;
            "N")
                echo "ok"
                continue
                ;;
            *)
                echo "выберите Y или N в следующий раз"
                continue
                ;;
        esac
    done
