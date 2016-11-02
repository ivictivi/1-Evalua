#!/bin/bash
echo "Introduce dos numeros entre el 0 y el 100"

read var1
read var2
if [ $var1 -ge 0 ] && [ $var1 -le 100 ]
then echo "$var1 esta entre el 1 y el 100"
else
echo "Es superior a 100"
fi
if [ $var2 -ge 0 ] && [ $var2 -le 100 ]
then echo "$var2 esta entre el 1 y el 100"
else
echo "Es superior a 100"
fi
