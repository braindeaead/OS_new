#!/bin/bash

k=$1
n=$2

for ((counter=0; counter<$k; counter++))
do
    bash newmem.sh $2&
done

