#!/bin/bash
error=0
if [ "$#" -le "1" ]
then
        echo -e "> Za mało parametrów"
        error=1
fi
if [ ! -f "$1" ]
then
	echo -e "> Plik zwykły \"${1}\" nie istnieje"
	error=1
fi
if [[ $1 != *.csv ]]
then
        echo -e "> \"${1}\" nie ma rozszerzenia csv"
        error=1
fi
if [[ $error == 1 ]]; then
	exit 1
fi
j=1
for i in $@
do
#	echo -e "$i"
	if [[ $j != 1 ]]
		then
		if [[ $i =~ ^[0-9]+$ ]]
		then
#Chyba pani w poleceniu chodziło -v a nie -u. Tak zgaduję.
			awk -F';' -v N1="$i" '{print $N1}' $1
			echo -e ""
		else
			echo -e "> Złe dane wejściowe \"${i}\"\n"
		fi
	fi
	j=0
done
#totalnie nie mam pomysłu jak zrobić aby kolumny były obok siebie
