#!/bin/bash

if [[ "$#" -eq 0 ]]
then
    echo "Brak argumentów\n"
    exit 1
fi

touch "merged.txt"


for file in "$@"
do
    if [[ ! -f "$file" ]]
    then
        echo -e "To nie jest plik zwykły.\n"
    else
        echo -e "=========== ${file} =============\n" >> "merged.txt"
        cat "$file" >> "merged.txt"
        echo -e "" >> "merged.txt"
    fi
done
