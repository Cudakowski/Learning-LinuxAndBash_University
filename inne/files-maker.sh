#!/bin/bash

if [[ "$#" -eq 0 ]]
then
    N=10
else
    N=$1
fi

for ((i=1; i<=N; i++))
do
    mkdir "Zadanie${i}"

#    touch "Zadanie${i}/main.cpp"
    echo -e "// Imie Nazwisko Zadanie ${i}\n" > "Zadanie${i}/main.cpp"

#    touch "Zadanie${i}/lab${i}.cpp"
    echo -e "// Imie Nazwisko Zadanie ${i}\n" > "Zadanie${i}/lab${i}.cpp"

#    touch "Zadanie${i}/lab${i}.h"
    echo -e "// Imie Nazwisko Zadanie ${i}\n" > "Zadanie${i}/lab${i}.h"
done
