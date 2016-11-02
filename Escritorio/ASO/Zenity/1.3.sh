
#!/bin/bash

suma=`zenity --entry --text "Introduce un valor a sumar"`

while [ $suma -le 100 ]
	do

incremento=`zenity --entry --text "Introduce otro valor a sumar"`
suma=`expr $suma + $incremento`
done
zenity --info --text "Resultado: $suma"

