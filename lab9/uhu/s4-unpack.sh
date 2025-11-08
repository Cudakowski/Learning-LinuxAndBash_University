#!/bin/bash
if [ "$1" != "" ]
   then
      if [ -d "$1" ]
         then
            zip=$(find $1 -maxdepth 1 -mindepth 1 -name "*.zip" 2> /dev/null)
            ilea=$(echo "$zip" | wc -l)
            if ((ilea==0))
               then
                  echo "Nie znaleziono archiwum."
               else
                  for ((i=1;i<=ilea;i++)); do
                     czip=$(echo "$zip" | head -n $i | tail -1)
                     ilef=$(zipinfo $czip | grep -v "^d" | wc -l)
                     if ((ilef>0))
                        then
                           dir=$(basename $czip .zip)
                           mkdir $dir
                           unzip $czip -d $dir
                        else
                           unzip $czip
                     fi
                  done
            fi
         else
            echo "Bledne dane."
      fi
   else
      zip=$(find $PWD -maxdepth 1 -mindepth 1 -name "*.zip" 2> /dev/null)1
      ilea=$(echo "$zip" | wc -l)
      if ((ilea==0))
         then
            echo "Nie znaleziono archiwum."
         else
            for ((i=1;i<=ilea;i++)); do
               czip=$(echo "$zip" | head -n $i | tail -1)
               ilef=$(zipinfo $czip | grep -v "^d" | wc -l)
               if ((ilef>0))
                  then
                     dir=$(basename $czip .zip)
                     mkdir $dir
                     unzip $czip -d $dir
                  else
                     unzip $czip
               fi
            done
      fi
fi

