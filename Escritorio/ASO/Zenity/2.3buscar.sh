#!/bin/bash
function Buscar()
for F in *
do 
if [ -d $F ]
then  echo "##$F es un directorio"
ls $F
echo ""
else [ -f $F ]
echo "##$F es un fichero"
echo ""
fi 
done 
Buscar
