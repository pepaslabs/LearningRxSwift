#!/bin/bash

set -e

# if you get tired of running "carthage update" before opening up
# each project, you can instead copy your Carthage folder into /tmp
# and then run this script.

# usage example: ./open.sh 3.7

if [ ! -e lesson${1}_*/problem/*/Carthage ]
then
    cp -a /tmp/Carthage lesson${1}_*/problem/*/ 
fi

open lesson${1}_*/problem/*/*.xcodeproj
