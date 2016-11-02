
#!/bin/bash

suma=0

while [ $suma -le 100 ]
	do
echo "Introduce numero"
read  sumatorio
suma=`expr $suma + $sumatorio`
done
echo "Resultado: $suma"

