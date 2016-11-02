#!/bin/bash
echo "Introduce un numero entre el 0 y el 100"
read var1
if [ $var1 -ge 0 ] && [ $var1 -le 100 ]
then echo "$var1 esta entre el 0 y el 100"
else
echo "Es superior a 100"
fi

