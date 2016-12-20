#!/bin/sh
for i in *; do
  if [ -d "$i" ] ; then
     cd "$i"
     echo 
     echo "===================================="
     echo Enter `pwd`
     echo
     CUE=`/bin/ls -1 *.cue`
     FLC=`/bin/ls -1 *.flac`
     echo shnsplit -f "$CUE" -t "%n %t" -o flac "$FLC"
     shnsplit -f "$CUE" -t "%n %t" -o flac "$FLC"
     echo "===================================="
     echo 
     cd ../
  fi
done

