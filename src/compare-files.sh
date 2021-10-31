#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied!"
    exit 99
fi

echo "Comparing files for their content..."
INPUT=$1
INPUT2=$2
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

newContent=`comm -13 <(sort $INPUT) <(sort $INPUT2) | wc -l`
removedContent=`comm -23 <(sort $INPUT) <(sort $INPUT2) | wc -l`

echo "New content count: $newContent"
echo "Removed content count: $removedContent"
