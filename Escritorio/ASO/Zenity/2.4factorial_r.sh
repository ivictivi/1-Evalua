#!/bin/bash
function factorial (){
if [ $1 -eq 1 ]
then echo 1
else echo `expr $(factorial $(expr $1 - 1)) \* $1`
fi
}
echo "El factorial de $1 es `factorial $1`"
