#!/bin/bash

du -a ~/* | sort -rn | head -n 10 | awk '{print NR ":\t" $1 "\t" $2}'

