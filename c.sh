#!/bin/sh
for i in *.flac; do 
DD=`basename "$i" .flac`
echo mkdir "$DD";
mkdir "$DD";
echo mv "$DD.flac" "$DD";
mv "$DD.flac" "$DD";
echo mv "$DD.cue" "$DD";
mv "$DD.cue" "$DD";
done
