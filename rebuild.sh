#!/bin/bash
check1=$(git diff ./configuration.nix /etc/nixos/configuration.nix)
check2=$(git diff ./home.nix ~/.config/home-manager/home.nix)

# Comprobar las diferencias en configuration.nix
if [ -n "$check1" ]; then
  echo -e "🚨 El archivo ./configuration.nix tiene diferencias con /etc/nixos/configuration.nix"
else
  echo -e "✅ El archivo /etc/nixos/configuration.nix está actualizado respecto a ./configuration.nix"
fi

# Comprobar las diferencias en home.nix
if [ -n "$check2" ]; then
  echo -e "🚨 El archivo ./home.nix tiene diferencias con ~/.config/home-manager/home.nix"
else
  echo -e "✅ El archivo ~/.config/home-manager/home.nix está actualizado respecto a ./home.nix"
fi

sudo cp -r * /etc/nixos/
sudo nixos-rebuild switch

cp -r * .config/home-manager/
home-manager switch

