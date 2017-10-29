#!/bin/sh

PKG='vwcol'

pdflatex $PKG.dtx
pdflatex $PKG.dtx
pdflatex $PKG.dtx

mkdir -pv CTAN-TMPDIR/$PKG/

cp $PKG.dtx   CTAN-TMPDIR/$PKG/
cp $PKG.ins   CTAN-TMPDIR/$PKG/
cp $PKG.pdf   CTAN-TMPDIR/$PKG/
cp README     CTAN-TMPDIR/$PKG/

cd CTAN-TMPDIR
zip -r $PKG.zip $PKG -x *.DS_Store

cd ..
mv CTAN-TMPDIR/$PKG.zip $PKG.zip
rm -rf CTAN-TMPDIR
