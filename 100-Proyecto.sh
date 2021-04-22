#!/bin/bash
#Autor: Miguel Ángel Lobato
#Versión: 1.0
#Descripción: proyecto ISO
#Parámetros
#Variables
FECHA=$(date +%d-%m-%Y-%H:%M)
esnumero='^[0-9]+$'
#Funciones
Encabezado()
{
    echo "________________________"
    echo "INFORME DE SERVIDORES"
    echo "Fecha: $FECHA"
    echo "________________________"
}
RedActual()
{
    ipared=$(ip r | awk -F" " 'NR==2 {print $1}')
    ipa=$(echo "$ipared" | cut -d. -f1 )
    ipb=$(echo "$ipared" | cut -d. -f2 )
    ipc=$(echo "$ipared" | cut -d. -f3 )
    redac="$ipa.$ipb.$ipc"
}
AnalizaCadena()
{
    ipaa=$(echo $redintro | cut -d. -f1 )
    ipbb=$(echo $redintro | cut -d. -f2 )
    ipcc=$(echo $redintro | cut -d. -f3 )
    ipdd=$(echo $redintro | cut -d. -f4 )
    if [[ $ipaa =~ $esnumero ]] && [[ $ipbb =~ $esnumero ]] && [[ $ipcc =~ $esnumero ]] && [[ $ipdd =~ $esnumero ]]
    then
        AnalizaRed
    else
        echo "Escribe una ip correcta (0.0.0.0 - 255.255.255.255)"
        fin=0
    fi
}
AnalizaRed()
{
    if [ $ipaa -lt 0 ] || [ $ipbb -lt 0 ]  || [ $ipcc -lt 0 ] || [ $ipdd -lt 0 ] || [ $ipaa -gt 255 ] || [ $ipbb -gt 255 ]  || [ $ipcc -gt 255 ] || [ $ipdd -gt 255 ]
    then
        echo "Escribe una ip correcta (0.0.0.0 - 255.255.255.255)"
        fin=0
    else
        red="$ipaa.$ipbb.$ipcc"
        fin=1  
    fi
}
Analizaini()
{
    if ! [[ $ipini =~ $esnumero ]] || [ $ipini -lt 1 ] || [ $ipini -gt 254 ] 
    then
        echo "Escribe una ip correcta (1-254)"
        fin=0
    else
        fin=1 
    fi
}
Analizafin()
{
    if ! [[ $ipfin =~ $esnumero ]] || [ $ipfin -lt $ipini ] || [ $ipfin -gt 254 ] 
    then
        echo "Escribe una ip correcta ($ipini-254)"
        fin=0
    else
        fin=1 
    fi
}
PideDatos()
{
    echo "________________________"
    echo "Toma de Datos"
    echo "________________________"
    echo ""
    fin=0
    while [ $fin -eq 0 ]
    do
        read -p "Introduce ip de red (intro para $redac.0): " redintro 
        if [ -z $redintro ]
        then
            red=$redac
            fin=1
        else
            AnalizaCadena
        fi
    done
    echo "La red será $red.0/24"
    fin=0
    while [ $fin -eq 0 ]
    do   
        read -p "Introduce ip inicial (intro para 1): " ipini
        if [ -z $ipini ]
        then
            ipini=1
            fin=1
        else
            Analizaini
        fi
    done 
    fin=0
    while [ $fin -eq 0 ]
    do   
        read -p "Introduce ip final (intro para 254): " ipfin
        if [ -z $ipfin ]
        then
            ipfin=254
            fin=1
        else
            Analizafin
        fi 
    done
    echo "Haremos ping entre $red.$ipini-$red.$ipfin"
}
CompruebaIp()
{
    Encabezado
    for i in $(seq $ipini 1 $ipfin)
    do
    ip1=$red.$i
    norecibido=$(ping -w 1 $ip1 | grep -w '0 received')
    if [ -z "$norecibido" ]
    then
        echo "$ip1:Sí hay conexión"
        echo "$ip1:Sí hay conexión" >> conectados-$FECHA.txt
    else
        echo "$ip1:No hay conexión"
    fi
    done
}
#Bloque principal
RedActual
PideDatos
Encabezado > conectados-$FECHA.txt
CompruebaIp
