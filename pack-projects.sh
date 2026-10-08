#!/bin/bash
OUTPUT_DIR="/d/NUR/Modulo2-2024/Example/nuget-repository"

# eliminar el contenido del directorio de salida
#rm -rf $OUTPUT_DIR
./build-nuget.sh ./src/Nur.Store2026.Integration/Nur.Store2026.Integration.csproj $OUTPUT_DIR