#!/usr/bin/awk -f

BEGIN {
print "IMIE","NAZWISKO","NUMER ALBUMU" , "LICZBA ZNALEZIONYCH WYNIKOW", "SUMA", "SREDNIA"
OFS="\t";
}
{suma=0;
for(i=4;i<=NF;i++)
suma+=$i;
print $1,$2,$3,(NF-3),suma,suma/(NF-3)
}
