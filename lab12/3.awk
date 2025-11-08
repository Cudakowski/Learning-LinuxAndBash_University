#!/usr/bin/awk -f
BEGIN {
j=1
}

/ / {
split($0, a, " ", seps);
nazw[j]=a[2];
imie[j]=a[1]
}

/^[0-9]{9}$/ {
tel[j]=$0
}
/@/ {
mail[j]=$0
}
/^[ \t]*$/ {
j++
}
END {
for (i=1;i<=j;i++)
print nazw[i],imie[i],mail[i],tel[i]
}

