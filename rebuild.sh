NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"
MODEL=$(cat /sys/class/dmi/id/product_name)

CONFIG_FILE="./configuration.nix"

if [[ "$MODEL" == "20AWS0RM00" ]]; then
  echo "Aplicando configuración para ThinkPad T440p"
  CONFIG_FILE="./configuration-t440p.nix"
else
  echo "Modelo no reconocido, aplicando configuración predeterminada"
fi

# Copiar archivos a las ubicaciones correspondientes
sudo cp -r ./modules "$NIXOS_PATH"
sudo cp -r ./users "$NIXOS_PATH"

cp -r ./modules "$HOME_PATH"
cp -r ./dotfiles "$HOME_PATH"
cp -r ./scripts "$HOME_PATH"

# Comparar archivos de configuración antes de copiar
echo "Mostrando cambios en '$CONFIG_FILE' y '$NIXOS_PATH/configuration.nix':"
git diff "$CONFIG_FILE" "$NIXOS_PATH/configuration.nix"

echo "Mostrando cambios en './home.nix' y '$HOME_PATH/home.nix':"
git diff "./home.nix" "$HOME_PATH/home.nix"

# Comparar las carpetas antes de copiarlas
echo "Mostrando cambios en './modulaes' y '$NIXOS_PATH/modules':"
git diff --no-index ./modules "$NIXOS_PATH/modules"

echo "Mostrando cambios en './dotfiles' y '$HOME_PATH/dotfiles':"
git diff --no-index ./dotfiles "$HOME_PATH/dotfiles"

echo "Mostrando cambios en './scripts' y '$HOME_PATH/scripts':"
git diff --no-index ./scripts "$HOME_PATH/scripts"

# Copiar archivos finales después de la comparación
sudo cp "$CONFIG_FILE" "$NIXOS_PATH/configuration.nix"
cp ./home.nix "$HOME_PATH/home.nix"

# Reconstruir NixOS y Home Manager
sudo nixos-rebuild switch
home-manager switch

# Agregar cambios al índice de git y hacer commit
git add .
git commit -m "new gen"
