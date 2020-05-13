#!/bin/bash

if [ $# -ne 2 ]
then
    echo "USAGE: $0 <URL> <COUNT#>"
    exit 1;
fi

URL=$1
COUNT=$2
c=1
while [ $c -le "$COUNT" ]
do
  echo -n `date +"[%T]"`
  printf " [# %d] GET %s - " "${c}" "${URL}"
  curl --silent --write-out ' - %{http_code}\n' -X GET "${URL}"
  c=`expr $c + 1`
  sleep 1
done