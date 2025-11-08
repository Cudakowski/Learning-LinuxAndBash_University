#!/bin/bash
funkcja() {
if [ "$1" == "" ]
   then echo "Nie podano nazwy pliku"
        exit
fi
}

while getopts "a:be:cdvh" option; do
  case $option in
    a)
funkcja $3
j=1
for i in $@ ; do
   if ((j>=3)) ; then
      mv $i $i.$2
      out[((j-1))]=$i.$2
   fi
   j=$((j+1))
done
 ;;
    b)
funkcja $2
j=1
for i in $@ ; do
   if ((j>=2)) ; then
      co=$i
      e=$(echo $i | wc -c)
      e=$((e-1))
      while ((k==0)) ; do
        e=$((e-1))
        k=$(echo $co | grep "\.$" | wc -l)
        co=$(echo $co | cut -b -$e)
        if ((e==0)) ; then
          echo "Brak rozszerzenia."
          exit
        fi
      done
      mv $i $co
      out[j]=$co
   fi
   j=$((j+1))
done
 ;;
    e)
funkcja $3
j=1
for i in $@ ; do
   if ((j>=3)) ; then
      co=$i
      e=$(echo $i | wc -c)
      e=$((e-1))
      while ((k==0)) ; do
        e=$((e-1))
        k=$(echo $co | grep "\.$" | wc -l)
        co=$(echo $co | cut -b -$e)
        if ((e==0)) ; then
          mv $i $i.$2
          out=$($i.$2)
          exit
        fi
      done
      mv $i $co.$2
      out[((j-1))]=$co
   fi
   j=$((j+1))
done
 ;;
    c)
funkcja $2
j=1
for i in $@ ; do
   if ((j>=2)) ; then
      max=$(echo $i | wc -c)
      max=$((max-1))
      path=$(dirname $i)
      min=$(echo $path | wc -c)
      min=$((min+1))
      core=$(echo $i | cut -b $min-$max)
      co=$core
      e=$(echo $core | wc -c)
      e=$((e-1))
      while ((k==0)) ; do
        e=$((e-1))
        k=$(echo $co | grep "\.$" | wc -l)
        co=$(echo $co | cut -b -$e)
        if ((e==0)) ; then
          co=$core
          f=$(echo $core | wc -c)
          f=$((f-1))
          while ((l==0)) ; do
             f=$((f-1))
             l=$(echo $co | grep "\-$" | wc -l)
             co=$(echo $co | cut -b -$f)
          done
          f=$((f+2))
          g=$(echo $core | wc -c)
          g=$((g-1))
          no=$(echo $core | cut -b $f-$g)
          mv $i $path/$no-$co
          out=$($path/$no-$co)
          exit
        fi
      done
      h=$(echo $core | wc -c)
      h=$((h-1))
      e=$((e+2))
      roz=$(echo $core | cut -b $e-$h)
      no=$co
      n=$(echo $co | wc -c)
      n=$((n-1))
      while ((m==0)) ; do
         n=$((n-1))
         m=$(echo $co | grep "\-$" | wc -l)
         co=$(echo $co | cut -b -$n)
      done
      e=$((e-2))
      n=$((n+2))
      no=$(echo $core | cut -b $n-$e)
      mv $i $path/$no-$co.$roz
      out=$($path/$no-$co.$roz)
   fi
   j=$((j+1))
done
 ;;
    d)
funkcja $2
j=1
for i in $@ ; do
   if ((j>=2)) ; then
      max=$(echo $i | wc -c)
      max=$((max-1))
      path=$(dirname $i)
      min=$(echo $path | wc -c)
      min=$((min+1))
      core=$(echo $i | cut -b $min-$max)
      co=$core
      f=$(echo $core | wc -c)
      f=$((f-1))
      while ((l==0)) ; do
         f=$((f-1))
         l=$(echo $co | grep "\-$" | wc -l)
         co=$(echo $co | cut -b -$f)
      done
      g=$(echo $core | wc -c)
      f=$((f+2))
      no=$(echo $core | cut -b $f-$g)
      mv $i $path/$no
      out=$($path/$no)
   fi
   j=$((j+1))
done
 ;;
    v)
funkcja $2
j=1
for i in $@ ; do
   if ((j>=2)) ; then
      echo "Zmiana z $i na ${out[j]}" #mam pomysł jak to zrobić ale nie mam siły, mam dość :C
   fi
   j=$((j+1))
done
 ;;
    h)
funkcja $
j=1
for i in $@ ; do
   if ((j>=3)) ; then
      xd=1
   fi
   j=$((j+1))
done
 ;;
    :) echo "Opcja -$option wymaga argumentu."
       exit 1 ;;
   \?) echo "Nieznana opcja: -$option"
       exit 1 ;;
  esac
done
