#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo -e "Brak argumentow"
	exit 1
fi
touch merged.txt
for plik in "$@"
do
	if [[ ( $plik == *.txt || $plik != *.* ) && -f $plik ]]; then
		echo -e "=========== ${plik} =============" >> merged.txt
		cat "$plik" >> merged.txt
		echo -e "" >> merged.txt
	else
                echo -e "To nie jest plik zwykły, badz tekstowy, badz plik nie istnieje.\n"
	fi
done
