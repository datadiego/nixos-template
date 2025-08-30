NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"
MODEL=$(cat /sys/class/dmi/id/product_name)

CONFIG_FILE="./configuration.nix"


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

git diff $CONFIG_FILE $NIXOS_PATH$CONFIG_FILE

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
