#!/bin/bash
echo "Nazwa skryptu: $0"
echo "Pierwszy argument: $1"
echo "Liczba argumentów: $#"
echo "Wszystkie: $*"
shift +2
echo "Kolejny pierwszy: $1"
echo "Liczba argumentów: $#"
echo "Liczba argumentów: $#"
echo "Wszystkie: $*"
echo ""
echo "3.2 + 5.3" | bc -l
echo "3.2 + 5.3"
