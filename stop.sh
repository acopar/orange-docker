#!/bin/bash

i=$1
i=${i:-1}
x=$((5900 + $i))
y=$((6900 + $i))
docker rm $(docker stop $(docker ps -a -q --filter="name=orange$i"))
