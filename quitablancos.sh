#!/bin/bash

# Comprobamos si hay archivos con espacios en el directorio actual
if ! ls | grep " " > /dev/null; then
    echo "No hay archivos con espacios en el directorio actual."
    exit 0
fi

# Contador para archivos procesados
archivos_procesados=0

# Iteramos sobre todos los archivos del directorio actual que contengan espacios
for archivo in *" "*; do
    # Verificamos que el archivo existe (por si hay cambios durante la ejecución)
    if [ -e "$archivo" ]; then
        # Creamos el nuevo nombre reemplazando espacios por guiones bajos
        nuevo_nombre=$(echo "$archivo" | tr ' ' '_')
        
        # Renombramos el archivo
        mv "$archivo" "$nuevo_nombre"
        
        # Incrementamos el contador y mostramos el cambio realizado
        ((archivos_procesados++))
        echo "Renombrado: '$archivo' -> '$nuevo_nombre'"
    fi
done

# Mostramos resumen final
echo -e "\nProceso completado."
echo "Total de archivos procesados: $archivos_procesados"
