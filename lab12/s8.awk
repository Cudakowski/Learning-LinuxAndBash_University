#!/usr/bin/awk -f

BEGIN {
FS=";"
print "IMIE, NAZWISKO, LICZBA OCEN, SUMA, SREDNIA"
suma_sr=0
}

{
suma=0;
for(i=4;i<=NF;i++) suma+=$i;
print $1,$2,NF-4,suma,suma/(NF-4);
suma_sr+=(suma/(NF-4))
}

END {
print suma_sr/NR
}
