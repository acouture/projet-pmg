#!/bin/bash

cp $1 tmp

i=0

while true; do
  read -r lineA <&3
  read -r lineB <&4
  if [[ i -gt 0 ]]; then
    if [ -z "$lineA" -o -z "$lineB" ]; then
      break
    fi
    arrayA=($lineA)
    arrayB=($lineB)
    speedup=$(expr ${arrayA[1]} / ${arrayB[1]});
    echo "${arrayA[0]} $speedup"
  fi
  i=1
done 3<$1 4<$2

rm tmp
