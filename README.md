# Reto-Intelimetrica

## Nombre: :alien:

:space_invader: José Emiliano Herrera Velázquez

<div align="center">
	<br>
	<a href="https://raw.githubusercontent.com/sindresorhus/css-in-readme-like-wat/main/readme.md">
		<img src="https://media0.giphy.com/media/SVCSsoKU5v6ZJLk07n/giphy.gif?cid=790b76117bed0624b9957059e56be86d39ee97e200035864&rid=giphy.gif&ct=g" width="800" height="400" alt="Data science">
	</a>
	<br>
</div>

Esta es mi solución al reto de Intelimétrica

## Solución :sunglasses:

### Análisis exploratorio
:point_right: Después de descargar el archivo [starts_data.csv](https://recruiting-datasets.s3.us-east-2.amazonaws.com/starts_data.csv) apliqué los comandos `head starts_data.csv` y `tail starts_data.csv` que muestran los primeros y últimos 5 registros del archivo en cuestión.


:point_right: Se observa que la primera línea del archivo es un caracter que no sirve, así como la última. Además, los nombres de los campos están separadas por "~", los primeros registros están separados por comas y los últimos por tabuladores. 

:point_right: Una vez realizada la limpieza de los puntos anteriormente mencionados obtenemos un "dataframe" de dimensión 119615 registros y 37 campos.

### Programa de limpieza (recuperación) del archivo

:point_right: Este programa fué escrito en bash. Hace uso de los comandos `awk` y `sed`. Y se usa de la siguiente manera en la terminal:

`./limpieza.sh archivo_a_recuperar`

En este caso sería:

`./limpieza.sh starts_data.csv`

:point_right: Esto arroja un directorio llamado "archivos" donde se alojan los .csv y .psv con los datos límpios.

:point_right: Por último, con el comando `file -bi` observamos que los archivos con los datos limpios están en formato "us-ascii" lo que significa que están codificados en "utf-8" ya que estos primeros son como un "subconjunto de utf-8" [Force encode from US-ASCII to UTF-8 (iconv)
](https://stackoverflow.com/questions/11303405/force-encode-from-us-ascii-to-utf-8-iconv).

