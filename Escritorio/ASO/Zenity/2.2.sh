#!/bin/bash

#Funcion del menu, me muestra el menu por pantalla.
menu (){
	clear
	echo "1.-Suma"
	echo "2.-Resta"
	echo "3.-Multiplica"
	echo "4.-Divide"
	echo "0.-Salir"
	read operacion
	#return $operacion guarda el numero que as seleccionado en $?
}

#Funcion que suma
sumar (){
	echo "Introduce parametros para sumar"
	read op1
	read op2
	resultado=`expr $op1 + $op2`
}

#Funcion que resta
restar (){ 
        echo "Introduce parametros para restar"
	read op1
	read op2 
        resultado=`expr $op1 - $op2`
}

#Funcion que multiplica
multiplicar (){ 
        echo "Introduce parametros para multiplicar"
	read op1
	read op2 
        resultado=`expr $op1 \* $op2` 
}

#Funcion que divide
dividir (){
	echo "Introduce parametros para dividir"
	read op1
	read op2 
        resultado=`expr $op1 \/ $op2` 
}

#Funcion hace que al elegir una opcion se ejecute las funciones arriba hechas
calcular (){
case $operacion in
	1)sumar;;
	2)restar;;
	3)multiplicar;;
	4)dividir;;
	0)exit 0;;
esac
}


while true
do
#Llama a la funcion menu y me muestra el menu
 menu
if [ $operacion -le 4 ] && [ $operacion -ge 0 ]
then
#LLama a la funcion calcular.
calcular

#Muestro el resultado por pantalla.
echo -e "Resultado: $resultado"
fi
read -p "Pulse cualquier tecla para continuar"

done

