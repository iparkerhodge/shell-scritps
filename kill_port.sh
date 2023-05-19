#!/bin/bash
# file: /Users/parkerhodge/bin/kill_port
PS3='Please enter your choice: '
options=$(lsof -PiTCP -sTCP:LISTEN | awk 'BEGIN{OFS="~"} {print $1,$9}' | sed -n '1!p')
RED='\033[0;31m'
NC='\033[0m'
select port in $options
do
  echo "Selected port: $port"
  echo "Selected option: $REPLY"
  var2=$(echo $port | cut -f2 -d:)
  echo -e "killing ${RED}port $var2 ${NC}!"
  echo $(lsof -ti tcp:$var2 | xargs kill)
  exit 0
done