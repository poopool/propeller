#! /bin/bash
# appLariat generic entrypoint.sh

#echo "Printing build log"
#cat /tmp/build.log

echo release tag: $BB_BRANCH > /version.txt

#Starting propeller
./propeller