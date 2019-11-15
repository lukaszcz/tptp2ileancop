#!/bin/bash

rm -rf ILTP/leancop 2>/dev/null

# translate the problems from FOF TPTP to ileancop format
cd ILTP
for f in `find Problems -name "*.p" -print`
do
    TPTP2X/tptp2X -f leancop -t stdfof+add_equality $f
done
cd ..

./fix_ileancop.sh
