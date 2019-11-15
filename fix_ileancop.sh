#!/bin/bash

rm -rf ILTP-ileancop* 2>/dev/null
mkdir ILTP-ileancop

# fix comments
for f in ILTP/leancop/*/*.leancop
do
    f1=`echo $f | sed 's/+stdfof+.*.leancop/.p/' | sed 's|ILTP/leancop/|ILTP/Problems/|'`
    out=ILTP-ileancop/`echo $f | sed 's/+stdfof+.*.leancop/.icp/' | xargs basename`
    tmp=$f1.tmp
    iconv -c -t UTF-8 $f1 -o $tmp
    grep '% ' $tmp > $out
    grep -v "^%" $f >> $out
    rm $tmp
done

# remove non-theorems
for f in `grep -l "Status (intuit.) : Non-Theorem" ILTP-ileancop/*.icp`
do
    rm $f
done

# rename files
for f in ILTP-ileancop/*.icp
do
    f2=ILTP-ileancop/`basename $f .icp | tr '+' '_' | tr '.' '_'`.icp
    mv $f $f2
done

# distribute problems to different directories based on rating
for d in 0.00 0.25 0.50 0.75 1.00
do
    mkdir ILTP-ileancop-$d/
    grep -l "Rating (intuit.) : $d" ILTP-ileancop/*.icp | xargs -I{} cp {} ILTP-ileancop-$d/
done
