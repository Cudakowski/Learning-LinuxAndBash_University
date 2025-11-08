#!/bin/bash
for i in $@; do
   if [ -f "$i" ] || [ -d "$i" ]
      then
          find $PWD -mindepth 1 -type d -exec cp $i {} \;
      else
          echo "$i nie istnieje"
   fi
done
