#!/bin/bash
if [ "$2" != "" ]
   then
      if [ -d "$2" ]
         then
            a=$(find "$2" -type f -exec grep "\b$1\b" {} \; 2> /dev/null | wc -l)
            echo "Slowo $1 wystopilo $a razy."
         else
            echo "Bledne dane."
      fi
   else
      a=$(find $PWD -type f -exec grep "\b$1\b" {} \; 2> /dev/null | wc -l)
      echo "Slowo $1 wystapilo $a razy."
fi

