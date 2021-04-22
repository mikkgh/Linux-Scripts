# Ejemplos Wget

Usar Wget para descargar archivos individuales. Para descargar un único archivo y almacenarlo en tu directorio de trabajo actual:

    wget https://wordpress.org/latest.zip

Se puede usar -i para obtener todos los archivos almacenados en un archivo de texto:

    wget -i example.txt

Puedes utilizar wget para colocar un archivo en otro directorio usando la función -P:

    wget -P documents/archives/ https://wordpress.org/latest.zip
    
El comando también se puede usar con FTP. Solo necesitarás especificar el nombre de usuario y la contraseña:

    wget --ftp-user=user --ftp-password=passwd ftp://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-10.8.0-amd64-DVD-1.iso
    
Usar Wget para recuperar sitios web completos:

    wget --mirror --convert-links --page-requisites --no-parent -P documents/websites/ https://www.google.es

Usar Wget para localizar enlaces rotos. En el archivo wget-log podemos encontrar la lista de enlaces rotos:

    wget -o wget-log -r -l 5 --spider http://www.google.es

Usar Wget para descargar archivos numerados. Sirve cuando tienes archivos o imágenes numeradas en una lista determinada:

    wget http://ejemplo.com/imagenes/{1..50}.jpg




