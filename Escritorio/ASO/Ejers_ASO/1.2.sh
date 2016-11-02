#!/bin/bash


read -p "Introduza la edad: " edad

case $edad in 
	[0-9]|1[0-3]) echo Es un niño.;;
	1[4-8]) echo Es un joven.;;
	*) echo Es un adulto;;
esac

