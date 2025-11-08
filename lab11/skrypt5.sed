#!/bin/sed -f
s/\bfile\b/plik/g
/".*plik.*"/ {s/plik/file/g}
s/([A-Za-z]+)_([A-Za-z]+)/\2_\1/
