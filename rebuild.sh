NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"

CONFIG_FILE="./configuration.nix"

if [[ "$1" == "--thinkpad440" ]]; then
  CONFIG_FILE="./configuration-t440p.nix"
fi

sudo cp -r ./modules "$NIXOS_PATH"
sudo cp -r ./users "$NIXOS_PATH"

cp -r ./modules "$HOME_PATH"
cp -r ./dotfiles "$HOME_PATH"
cp -r ./scripts "$HOME_PATH"

sudo cp "$CONFIG_FILE" "$NIXOS_PATH"

cp ./home.nix "$HOME_PATH"

sudo nixos-rebuild switch
home-manager switch

git add .
git commit -m "new gen"
