#!/bin/bash
if [ "$2" != "" ]
	then
		if [ -d "$2" ]
			then
				a=$(grep "\b$1\b" $2/* 2> /dev/null | wc -l)
				echo "Slowo $1 wystopilo $a razy."
			else
				echo "Bledne dane."
		fi
	else
		a=$(grep "\b$1\b" $PWD/* 2> /dev/null | wc -l)
		echo "Slowo $1 wystapilo $a razy."
fi

