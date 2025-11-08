#!/bin/bash
if [[ $# -eq 0 ]];then
        N=5
else
        N=$1
	if [[ ! $1 =~ [0-9]+ ]]; then
		echo -e "Bledne dane"
		exit 1
	fi
fi
for ((i=1; i<=N; i++))
do
    mkdir -p "Zadanie${i}"
    echo -e "// Wojciech Osowski Zadanie ${i}\n" > "Zadanie${i}/main.cpp"
    echo -e "// Wojciech Osowski Zadanie ${i}\n" > "Zadanie${i}/lab${i}.cpp"
    echo -e "// Wojciech Osowski Zadanie ${i}\n" > "Zadanie${i}/lab${i}.h"
done
