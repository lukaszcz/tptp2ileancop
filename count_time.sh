#!/bin/bash

COUNT=0
for f in `grep -l "Intuitionistic Theorem" logs/*.log`
do
    TIME=`cat $f | grep "time:" | sed 's/time: \(.*\) secs/\1/'`
    if (( $(echo "$TIME < $1" | bc -l) )); then
        COUNT=$((COUNT + 1))
    fi
done
echo $COUNT
