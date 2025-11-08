#!/bin/bash
funkcja() {
if [ "$1" == "" ]
   then echo "Nie podano ciągu znaków"
        exit
fi
}

while getopts "r:ud:p:l" option; do
  case $option in
    r)
funkcja $3
read -p "Podaj znak: " znak
echo $3 | tr "[$OPTARG]" "$znak"
 ;;
    u)
funkcja $2
echo $2 | tr "[a-z]" "[A-Z]"
 ;;
    d)
funkcja $3
echo $3 | tr -d "$OPTARG"
 ;;
    p)
funkcja $3
b=$3
a=0
while ((a==0)); do
   b=$(echo $b | cut -b 2-)
   a=$(echo $b | grep "^$OPTARG" | wc -l )
done
echo $b
 ;;
    l)
funkcja $2
c=$(echo $2 | wc -m)
echo $((c-1))
 ;;
    :) echo "Opcja -$option wymaga argumentu."
       exit 1 ;;
   \?) echo "Nieznana opcja: -$option"
       exit 1 ;;
  esac
done
