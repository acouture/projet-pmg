#!/bin/bash

echo "" > speedup.g

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
    speedup=$(echo "${arrayA[1]} / ${arrayB[1]}" | bc -l)
    echo "${arrayA[0]} $speedup" >> $3
  fi
  i=1
done 3<$1 4<$2

