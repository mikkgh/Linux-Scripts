# El script Respuesta de PCs en la red

Este script se basa en uno de los scripts practicados en clase que trataba de comunicarse con los pcs de una determinada red a través de ping.

El script está mejorado en los siguientes aspectos:

    1. Nos ofrece elegir la red a la que estamos conectados actualmente simplemente pulsando intro.
       	
    2. Podemos elegir cualquier otra red. El script comprobará que la entrada sea una ip válida.
       
    3. Nos ofrece elegir la ip inicial, y asignará el valor 1 si se pulsa intro.
       
    4. Nos ofrece elegir la ip final, y asignará el valor 254 si se pulsa intro.
       
    5. El script comprobará que las entradas de ip inicial e ip final sean correctas.
       
    6. El script recorrerá todas las ips generando en pantalla el valor de la ip y si hay o no conexión.
       
    7. Se genera un archivo llamado conectados con la fecha actual donde estarán las ips que respondieron.


# Utilidad

	Muchas veces necesitamos saber qué ordenadores están conectados a nuestra red.
	El script es bastante ágil a la hora de escanear toda la red simplemente pulsando varios intros.
	Pero a la vez es lo suficientemente versátil para dejarnos elegir todos los parámetros de búsqueda.
	No permite entradas erróneas, y da consejos sobre los parámetros cuando se produce error en la entrada. 
