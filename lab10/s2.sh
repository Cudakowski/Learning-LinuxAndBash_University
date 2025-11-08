#!/bin/bash

funkcja1() {
najw=${tab[0]}
najmn=${tab[0]}
for ((i=0;i<=num;i++)) ; do
   if ((tab[i] > najw))
      then najw=${tab[i]}
   fi
   if ((tab[i] < najmn))
      then najmn=${tab[i]}
   fi
done
echo "Największa: $najw Najmniejsza: $najmn"
}

funkcja2() {
suma=0
j=0
for ((i=0;i<=num;i++)) ; do
   suma=$((suma+tab[i]))
done
sr=$((suma/(num+1)))
echo "scale=2; $suma / ( $num + 1 )" | bc
}

funkcja3() {
for ((i=0;i<=num;i++)) ; do
   tab[i]=$((tab[i]+1))
   echo "${tab[i]}"
done
}

funkcja4() {
read -p "Podaj liczbę: " liczba
k=0
for ((i=0;i<=num;i++)) ; do
   if ((tab[i] > liczba))
      then k=$((k+1))
   fi
done
echo $k
}

funkcja5() {
echo ${tab[@]} | tr " " "\n" | sort -n | tr "\n" " "
}


if [ "$1" == "" ]
   then echo "Nie podano pliku"
        exit
fi
if [[ $1 != *.txt ]]
   then echo "To nie jest plik tekstowy"
   exit
fi
if [ ! -f "$1" ] ; then
   echo "Plik nie istnieje"
   exit
fi
a=$(cat $1)

num=0

for i in $a ; do
   if [[ $i =~ ^-?[0-9]+(\.[0-9]+)?$ ]] ; then
        tab[num]="$i"
        echo ${tab[num]}
        num=$((num+1))
   fi
done
num=$((num-1))
select y in "Największa i najmniejsza" "Średnia" "Zwiększenie o numer indeksu każdego elementu tablicy" "Ile większych od podanej" "Posortowanie rosnąco" Quit
do
 case $y in
  "Największa i najmniejsza")
funkcja1
 ;;
  "Średnia")
funkcja2
 ;;
  "Zwiększenie o numer indeksu każdego elementu tablicy")
funkcja3
 ;;
  "Ile większych od podanej")
funkcja4 ;;
  "Posortowanie rosnąco")
funkcja5
 ;;
  "Quit") exit ;;
  *) echo "Nic nie wybrałeś"
 esac
done
