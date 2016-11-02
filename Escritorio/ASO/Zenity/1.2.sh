#!/bin/bash


edad=`zenity --entry --text "Introduza la edad: "`
case $edad in 
	[0-9]|1[0-3]) zenity --info --text " Es un niño";;
	1[4-8]) zenity --info --text "Es un joven";;
	*) zenity --iinfo --text "Es un adulto";;
esac

