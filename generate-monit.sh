#!/bin/bash

PID_FOLDER=/var/run/docker-compose/

list_containers=`docker ps -f status=running --format "{{.Names}}"`


for container in $list_containers; do
  cat << EOF > ./monit/docker_compose_$container.conf
check process $container with pidfile $PID_FOLDER$container.pid
  start program = "/usr/bin/docker start $container" as uid "docker" and gid "docker"
  stop program = "/usr/bin/docker stop $container" as uid "docker" and gid "docker"

EOF
done;
