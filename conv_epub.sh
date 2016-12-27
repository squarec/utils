#!/bin/sh
if [ ! -d text ]; then
    echo "!!Warning: Please go to top directory!!\n"
	exit 0
fi
cd text
mkdir trd 
for i in *.html; do
  if [ -e "$i" ]; then
    echo cconv -f UTF8-CN -t UTF8-TW -o trd/${i} $i;
    cconv -f UTF8-CN -t UTF8-TW -o trd/${i} $i;
  fi
done
/bin/mv -f trd/* .
rm -rf trd
cd ../
# Convert TOC
cconv -f UTF8-CN -t UTF8-TW -o toc.ncx.trd toc.ncx;
/bin/mv -f toc.ncx.trd toc.ncx

echo "\nDone!!\n"
