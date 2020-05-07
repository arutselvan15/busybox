#!/bin/bash

if [ $# -ne 3 ]
then
    echo "USAGE: $0 <URL> <COUNT#> <CONCURRENT#>"
    exit 1;
fi

SEND_REQUESTS_CMD="sh send-requests.sh"
URL=$1
COUNT=$2
CONCURRENT=$3
c=1
while [ $c -le "$CONCURRENT" ]
do
  echo "Parallel# ${c}"
  ${SEND_REQUESTS_CMD} "${URL}" "${COUNT}" && echo "Done Parallel# ${c}" &
  c=`expr $c + 1`
  sleep 1
done

wait