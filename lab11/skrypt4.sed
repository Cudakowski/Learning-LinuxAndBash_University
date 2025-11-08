#!/bin/sed -f
/\/\*+.*\*+\// {s/[\/\*]//g ; s/^/\/\//g}
/\/\*+/,/\*+\// {s/[\*\/]//g ; s/.*\S/\/\/&/g}
s/\/\/.*//g 
#skopiowałem skrypt do podpunktu drugiego i dopisałem tylko jedną linijke ¯\_(c:)_/¯
