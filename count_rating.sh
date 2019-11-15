#!/bin/bash

for f in `grep -l "Rating (intuit.) : $1" problems/*.icp`
do
    basename $f
done | sed 's/icp$/log/' | awk '{print "logs/"$1}' | xargs grep "Intuitionistic Theorem" | wc -l | xargs -I {} echo {} "/" `grep -l "Rating (intuit.) : $1" problems/*.icp | wc -l`
