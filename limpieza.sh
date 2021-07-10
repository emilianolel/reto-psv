#!/bin/bash

# El objetivo de este programa es limpirar el .csv corrupto y ayudar a los científicos a recuperar
# esta valiosa información.

# El archivo a limpiar se guarda en la variable archivo
archivo=$1

# Se crea una carpeta llamada archivos que es donde se guardarán los archivos .csv y .psv limpios
# y listos para su análisis.
mkdir archivos

# Primero se elimina la primera línea del archivo "starts_data.csv".
sed '1d' $archivo > archivos/aux.csv

# Posteriormente se elimina la última fila del archivo "starts_data.csv".
sed -i '$ d' archivos/aux.csv

# Cambiamos las virgulillas por comas.
sed -i "s/~/,/g" archivos/aux.csv

# Luego intercambiamos los tabuladores por comas.
sed -i "s/\t/,/g" archivos/aux.csv

# Con ayuda del comando (en realidad lenguaje de programación AWK) se muestra
# el número de registros y el número de campos del archivo "starts_data.csv"
awk 'BEGIN {FS=","} END {printf "Número de filas: %s\nNúmero de columnas %s\n", NR, NF}' archivos/aux.csv

# Se le asigna el número de campos a la variable cols
cols=`awk 'BEGIN{FS=","} END{printf NF}' archivos/aux.csv`

# Se crea un directorio llamado aux dentro del directorio archivos, donde se guardaran unos archivos 
# auxiliares.
mkdir archivos/aux

# Realizamos un ciclo for para agregar las comillas a todos los valores del archivo.
for i in `seq 1 $cols`
do
	if [ $i -le 9 ]
	then
		awk -v var=$i 'BEGIN{FS=","}{print $var}' archivos/aux.csv | sed 's/^/"/;s/$/"/' > archivos/aux/aux0$i.csv
	else
		awk -v var=$i 'BEGIN{FS=","}{print $var}' archivos/aux.csv | sed 's/^/"/;s/$/"/' > archivos/aux/aux$i.csv
	fi
done

# Se unen todas las columnas en un sólo archivo .csv llamado "clean_starts_data.csv"
aux_files="archivos/aux/*"
paste -d , $aux_files > archivos/clean_starts_data.csv

# Se elimina el directorio aux
rm -r archivos/aux/ archivos/aux.csv

# Se crea el archivo .psv llamado "clean_starts_data.csv"
sed "s/,/|/g" archivos/clean_starts_data.csv > archivos/clean_starts_data.psv


