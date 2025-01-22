#!/bin/bash

# Pedimos el número de alumnos
echo "Introduce el número de alumnos de la clase:"
read num_alumnos

# Inicializamos variables
aprobados=0
suspensos=0
suma_notas=0

# Bucle para pedir las notas de cada alumno
for ((i=1; i<=$num_alumnos; i++))
do
    # Pedimos la nota del alumno actual
    echo "Introduce la nota del alumno $i:"
    read nota
    
    # Validamos que la nota esté entre 0 y 10
    while [[ $nota -lt 0 || $nota -gt 10 ]]
    do
        echo "La nota debe estar entre 0 y 10. Introduce la nota nuevamente:"
        read nota
    done
    
    # Contamos aprobados y suspensos
    if [[ $nota -ge 5 ]]
    then
        ((aprobados++))
    else
        ((suspensos++))
    fi
    
    # Sumamos la nota para calcular la media
    ((suma_notas += nota))
done

# Calculamos la nota media
nota_media=$(echo "scale=2; $suma_notas / $num_alumnos" | bc)

# Mostramos los resultados
echo -e "\nResultados:"
echo "Número de aprobados: $aprobados"
echo "Número de suspensos: $suspensos"
echo "Nota media de la clase: $nota_media"
