#!/bin/bash

docker build -t pkg .

for d in *
do
    [[ ! -d $d ]] && continue
    [[ $d == '.git' || $d == 'logs' ]] && continue
    ./docker.sh $d > logs/$d.log
    echo $d $?
done
