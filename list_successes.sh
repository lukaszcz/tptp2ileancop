#!/bin/bash

for f in `grep -l "Intuitionistic Theorem" logs$1/*.log`; do basename $f; done > successes$1.log
