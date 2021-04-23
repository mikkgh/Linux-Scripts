## Respuesta de PCs en la red

Vamos a analizar las distintas partes del script y la forma en que funcionan.

1. Cabecera del script y variables:
	La variable FECHA será necesaria para crear el archivo de salida
	La variable esnumero la necesitaremos para comprobar que las cadenas introducidas son números.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/variables.png)


2. Funciones:

	A. Encabezado()
		Es un pequeño encabezado para el archivo de salida con la fecha del informe.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/encabezado.png)
	
	B. RedActual()
		Obtenemos los parámetros de nuestra red para ofrecerla como red por defecto.
		Se guardará en la variable redact

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/redactual.png)

	C. PideDatos()
		Nos solicita la ip de la red y los valores de ip inicial e ip final.
		Estas solicitudes están dentro de bucles while que se repetirán hasta obtener los parámetros correctos.
		La variable fin controla el bucle. La inicializamos antes de cada while con fin=0 y el bucle se repetirá mientras tenga ese valor.
		Cuando se introduce el parámetro correcto, fin=1 y se saldrá del bucle.

		El primer while es para la ip. Si se pulsa intro se asigna a red=redact.
		Si no, saltaremos a AnalizaCadena para comprobar que lo introducido sean números.
		Si son todos números, se llamará a AnalizaRed donde se comprueba que los valores estén en rango.
		Si lo introducido no tiene formato numérico o está fuera de rango, avisamos del error, asignamos fin=0 y volvemos al bucle, que se repetirá de nuevo.

		El segundo while es para la ip inicial, si se pulsa intro se asigna a ipini=1.
		Si no, saltaremos a Analizaini para comprobar que lo introducido sea un número y que los valores estén en rango.
		Si lo introducido no tiene formato numérico o está fuera de rango, avisamos del error, asignamos fin=0 y volvemos al bucle, que se repetirá de nuevo.

		El tercer while es para la ip inicial, si se pulsa intro se asigna a ipfin=254.
		Si no, saltaremos a Analizafin para comprobar que lo introducido sea un número y que los valores estén en rango.
		Si lo introducido no tiene formato numérico o está fuera de rango, avisamos del error, asignamos fin=0 y volvemos al bucle, que se repetirá de nuevo.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/pidedatos.png)

	D. AnalizaCadena()
		Comprobamos que los campos de la ip introducida sean todos números.
		Si es así iremos a AnalizaRed. 
		Si no, ofreceremos los valores entre los cuales es admisible la ip y volveremos a solicitarla.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/analizacadena.png)

	E. AnalizaRed()
		Comprobamos que los valores de la ip estén en los rangos correctos 0<=ip<=255
		Si es así asignaremos la ip introducida valor a la variable red.
		Si no, ofreceremos los valores entre los cuales es admisible la ip y volveremos a solicitarla.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/analizared.png)

	F. Analizaini() y Analizafin()
		Comprobamos que los valores de ip inicial e ip final sean correctos.
		Ambos deben ser números, y estar en su rango correcto 1<=ip inicial<=254, ipinicial<=ip final<=254.
		Si es así volveremos dejando los valores introducidos en ipini e ipfin.
		Si no, ofreceremos los valores entre los cuales es admisible la ip y volveremos a solicitarla.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/analizaini-fin.png)

	G. CompruebaIp()
		Una vez tenemos nuestra red, ip inicial e ip final creamos un bucle for que hace ping a todas las ips del rango. 
		Si en el ping aparece '0 received', la variable norecibido será no nula, 
		Si norecibido es nula se confirmará por pantalla que hay conexión y se añadirá la linea al archivo de conectados.
		Si norecibido no es nula se confirmará por pantalla que no hay conexión.

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/compruebaip.png)


3. Bloque principal
	
	Se llama a las siguientes funciones:

	A. RedActual, con la que obtenemos los parámetros de la red por defecto.
	B. PideDatos, con la que obtenemos los parámetros correctos para la ip, ip inicial e ip final.
	C. Creamos el archivo conectados añadiendo el encabezado.
	D. CompruebaIP, con la que comprobamos el ping a las ips solicitadas y vamos añadiendo las ips con repuesta.	

![imagen](https://github.com/mikkgh/Linux-Scripts/blob/main/capturas/bloqueprincipal.png)














