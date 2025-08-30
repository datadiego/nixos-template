NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"
MODEL=$(cat /sys/class/dmi/id/product_name)

CONFIG_FILE="./configuration.nix"

./check.sh

echo "¿Quieres continuar? (S/N, Y/N, yes/no)"
read respuesta

# Convertir la respuesta a minúsculas
respuesta=$(echo "$respuesta" | tr '[:upper:]' '[:lower:]')

if [[ "$respuesta" == "s" || "$respuesta" == "y" || "$respuesta" == "yes" ]]; then
    echo "Empezando"
elif [[ "$respuesta" == "n" || "$respuesta" == "no" ]]; then
    echo "Operación cancelada."
    exit
else
    echo "Respuesta no válida. Por favor, responde con S/N, Y/N o yes/no."
    exit
fi



if [[ "$MODEL" == "20AWS0RM00" ]]; then
  echo "Aplicando configuración para thinkpad t440p"
  CONFIG_FILE="./configuration-t440p.nix"
fi

sudo cp -r ./modules "$NIXOS_PATH"
sudo cp -r ./users "$NIXOS_PATH"

cp -r ./modules "$HOME_PATH"
cp -r ./dotfiles "$HOME_PATH"
cp -r ./scripts "$HOME_PATH"

sudo cp "$CONFIG_FILE" "$NIXOS_PATH/configuration.nix"

cp ./home.nix "$HOME_PATH"

sudo nixos-rebuild switch
home-manager switch

git add .
git commit -m "new gen"
NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"
MODEL=$(cat /sys/class/dmi/id/product_name)

CONFIG_FILE="./configuration.nix"

git diff
# git diff $CONFIG_FILE $NIXOS_PATH$CONFIG_FILE

if [[ "$MODEL" == "20AWS0RM00" ]]; then
  echo "Aplicando configuración para thinkpad t440p"
  CONFIG_FILE="./configuration-t440p.nix"
fi

sudo cp -r ./modules "$NIXOS_PATH"
sudo cp -r ./users "$NIXOS_PATH"

cp -r ./modules "$HOME_PATH"
cp -r ./dotfiles "$HOME_PATH"
cp -r ./scripts "$HOME_PATH"

sudo cp "$CONFIG_FILE" "$NIXOS_PATH/configuration.nix"

cp ./home.nix "$HOME_PATH"

sudo nixos-rebuild switch
home-manager switch


git add .
git commit -m "new gen"
