NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"
MODEL=$(cat /sys/class/dmi/id/product_name)

CONFIG_FILE="./configuration.nix"

# ./check.sh

# echo "¿Quieres continuar?"
# read respuesta

# # Convertir la respuesta a minúsculas para manejar todas las combinaciones
# respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

# case "$respuesta" in
#     s|y|yes)
#         echo "Comenzando"
#         ;;
#     n|no)
#         echo "Operación cancelada."
#         exit
#         ;;
#     *)
#         echo "Respuesta no válida. Por favor, responde con S/N, Y/N o yes/no."
#         exit
#         ;;
# esac

git diff

if [[ "$MODEL" == "20AWS0RM00" ]]; then
  echo "Aplicando configuración para thinkpad t440p"
  CONFIG_FILE="./configuration-t440p.nix"
fi

# Copiar archivos y directorios
sudo cp -r ./modules "$NIXOS_PATH"
sudo cp -r ./users "$NIXOS_PATH"

cp -r ./modules "$HOME_PATH"
cp -r ./dotfiles "$HOME_PATH"
cp -r ./scripts "$HOME_PATH"

# Copiar el archivo de configuración
sudo cp "$CONFIG_FILE" "$NIXOS_PATH/configuration.nix"
cp ./home.nix "$HOME_PATH"

# Ejecutar reconstrucción
sudo nixos-rebuild switch
home-manager switch

# Realizar commit
git add .
git commit -m "new gen"
