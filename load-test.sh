#!/bin/bash

if [ $# -ne 2 ]
then
    echo "USAGE: $0 <URL> <DURATION>"
    exit 1;
fi

echo "GET ${1} | vegeta attack -duration=$2 | tee results.bin | vegeta report"
echo "================ start =================="

echo "GET ${1}" | vegeta attack -duration="$2" | tee results.bin | vegeta report

echo "================= end ==================="