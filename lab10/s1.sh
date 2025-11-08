#!/bin/bash
shopt -s globstar
if [ "$2" != "" ]
   then
      if [ -d "$2" ]
         then
            b=$2
         else
            echo "Bledne dane."
            exit
      fi
   else
      b=$PWD
fi
a=$(grep "\b$1\b" $b/** 2> /dev/null | wc -l)
echo "Slowo $1 wystapilo $a razy."
