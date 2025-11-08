#!/bin/bash
if [ "$1" != "" ]
   then
      if [ -d "$1" ]
         then
            a=$(find $1 -type f -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
            b=$(find $1 -type d -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
            c=$(find $1 -executable -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
            d=$(find $1 ! -type f ! -type d ! -executable -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
            echo "Pliki zwykłe: $a"
            echo "Katalogi: $b"
            echo "Pliki wykonywalne: $c"
            echo "Inne: $d"
         else
            echo "Bledne dane."
      fi
   else
      a=$(find $PWD -type f -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
      b=$(find $PWD -type d -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
      c=$(find $PWD -executable -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
      d=$(find $PWD ! -type f ! -type d ! -executable -maxdepth 1 -mindepth 1 2> /dev/null | wc -l)
      echo "Pliki zwykłe: $a"
      echo "Katalogi: $b"
      echo "Pliki wykonywalne: $c"
      echo "Inne: $d"
fi
