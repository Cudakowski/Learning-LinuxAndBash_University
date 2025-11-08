#!/usr/bin/awk -f

BEGIN {
OFS="\t";
print "Imię","Nazwisko","Numer albumu" , "Liczba znalezionych wyników", "Wynik sumaryczny", "Wynik średni"
}

{suma=0;
for(i=4;i<=NF;i++)
{
suma+=$i
}

print $1,$2,$3,(NF-3),suma,suma/(NF-3)
}

