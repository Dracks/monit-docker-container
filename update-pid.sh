#!/bin/bash

PID_FOLDERS=/var/run/docker-compose/

list_containers=`docker ps -f status=running --format "{{.Names}}"`

# rm "$PID_FOLDERS*"

for container in $list_containers; do
  pid=`docker inspect -f "{{.State.Pid}}" $container`
  echo $pid > $PID_FOLDERS$container.pid
done;
