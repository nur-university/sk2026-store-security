#!/bin/bash

# Verificar que se haya pasado la ruta del proyecto como argumento
if [ -z "$1" ]; then
  echo "❌ Error: Debes proporcionar la ruta al archivo .csproj como argumento."
  echo "👉 Ejemplo: ./build-nuget.sh ./src/MiLibreria/MiLibreria.csproj ./artifacts"
  exit 1
fi

if [ -z "$2" ]; then
  echo "❌ Error: Debes proporcionar la ruta a la carpeta de destino del nuget package."
  echo "👉 Uso: ./build-nuget.sh ./src/MiLibreria/MiLibreria.csproj ./artifacts"
  exit 1
fi

# Asignar la ruta del proyecto desde el argumento
PROJECT_PATH="$1"
CONFIGURATION="Release"
OUTPUT_DIR="$2"

# Crear el directorio de salida si no existe
mkdir -p "$OUTPUT_DIR"

echo "🔧 Restaurando paquetes para $PROJECT_PATH..."
dotnet restore "$PROJECT_PATH"

echo "🏗️  Compilando proyecto..."
dotnet build "$PROJECT_PATH" --configuration $CONFIGURATION --no-restore

echo "📦 Empaquetando como NuGet..."
dotnet pack "$PROJECT_PATH" \
  --configuration $CONFIGURATION \
  --output "$OUTPUT_DIR" \
  --no-build

echo "✅ Paquete NuGet generado en: $OUTPUT_DIR"