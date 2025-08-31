# Antes de lanzar el script debes instalar home-manager y ejecutar 'home-manager init'
sudo cp -r modules /etc/nixos/
sudo cp -r scripts /etc/nixos/
sudo cp -r services /etc/nixos/
sudo cp -r users /etc/nixos/
cp wallpaper $HOME/.config/home-manager/
cp -r scripts $HOME/.config/home-manager/
cp -r services $HOME/.config/home-manager/
cp -r modules $HOME/.config/home-manager/
./rebuild.sh