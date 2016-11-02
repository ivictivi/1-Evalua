#!/bin/bash
valores=`zenity --forms --title="Numeros enre el 0 y el 100" \
--text="Introduce dos numeros" \
--separator="," \
--add-entry="Primero valor" \
--add-entry="Segundo valor"` 
V1=`echo "$valores" | cut -f1 -d","`
V2=`echo "$valores" | cut -f2 -d","`
if [ `echo $V1 $V2 | wc -w` -ne 2 ]
then 
zenity --info --text "El numero de argumentos no es 2"
elif [ $V1 -ge 0 ] && [ $V1 -le 100 ] && [ $V2 -ge 0 ] && [ $V2 -le 100 ]
then 
zenity --info --text="El numero de argumentos es 2 y los argumentos estan comprendidos en el rango [0-100]"

elif [ $V1 -ge 0 ] && [ $V1 -le 100 ]
then
zenity --info --text="El numero de argumentos es 2 y el primero de los dos está comprendido en el rango [0-100] pero el segundo no"
 
elif [ $V2 -ge 0 ] && [ $V2 -le 100 ]
then 
zenity --info --text="El numero de argumentos es 2 y el segundo de los dos está comprendidio en el rango [0-100] pero el primero no"
else
zenity --info --text="El numero de argumentos es 2 y ninguno de los dos argumentos están comprendidios en el rango [0-100]"
echo
fi

