NIXOS_PATH="/etc/nixos/"
HOME_PATH="$HOME/.config/home-manager/"

sudo cp -r ./modules $NIXOS_PATH
sudo cp -r ./users $NIXOS_PATH
cp -r ./dotfiles $HOME_PATH
cp -r ./scripts $HOME_PATH

sudo cp ./configuration.nix $NIXOS_PATH
cp ./home.nix $HOME_PATH

sudo nixos-rebuild switch

git add .
git commit -m "new gen"
