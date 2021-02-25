#!/bin/bash

array=()
counter=0
add=(1 1 1 1 1 1 1 1 1 10 1 1 1 1 1 1 1 1 1 20 1 1 1 1 1 1 1 1 1 30 1 1 1 1 1 1 1 1 1 40 1 1 1 1 1 1 1 1 1 50)
while true
do
    array+=(${add[*]})
    
    counter=$(($counter+1))
    
    if [[ $counter == 1000 ]]
    then
        echo "${#array[*]}" >> report.log
        counter=0
    fi

done
