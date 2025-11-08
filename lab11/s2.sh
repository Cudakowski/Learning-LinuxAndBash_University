#!/bin/bash
if [ "$1" != "" ]
   then
      if [ ! -f "$1" ]
         then
            echo "Bledne dane."
            exit
      fi
   else
      echo "Nie podano pliku."
      exit
fi
sed -e '1d' -Ee 's/[0-9]+//g' -Ee 's/([A-Za-z ]+);([A-Za-z ]+)/\2 \1/' -e 's/;/ /g' -e 's/^ //g' -e 's/  / /g' $1 | sort | nl | sed -e 's/^     //g' -e 's/\t/) /'

#Nie zauważyłem, że wynik ma być bez wieku, dlatego trochę przekombinowałem.
#Kiedy usunie się "-Ee 's/[0-9]+//g'" wynik zawiera wiek.
