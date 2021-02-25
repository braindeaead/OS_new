#!/bin/bash

array=()
counter=0
add=(1 1 1 1 1 1 1 1 1 10 1 1 1 1 1 1 1 1 1 20 1 1 1 1 1 1 1 1 1 30 1 1 1 1 1 1 1 1 1 40 1 1 1 1 1 1 1 1 1 50)

if [[ $# == 0 ]]
then
    N=100000000
else
    N=$1
fi

while true
do
    array+=(${add[*]})

    counter=$(($counter+1))
    
    if [[ $counter == 10000 ]]
    then
        counter=0
    fi

    if [[ ${#array[*]} == $1 ]]
    then
        echo $N
        exit 0
    fi

done
