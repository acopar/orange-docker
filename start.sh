#!/bin/bash

i=$1
i=${i:-1}
x=$((5900 + $i))
y=$((6900 + $i))
docker run -d -p 127.0.0.1:$x:5901 -p 127.0.0.1:$y:6901 --name="orange$i" --user="$(id -u):$(id -g)" acopar/orange-docker
