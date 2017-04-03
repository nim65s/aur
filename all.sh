#!/bin/bash

docker build -t pkg .

for d in *
do
    echo $d
    [[ ! -d $d ]] && continue
    [[ $d == '.git' || $d == 'logs' ]] && continue
    ./docker.sh $d > logs/$d.log
done
