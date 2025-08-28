# ./users/user.nix
# https://search.nixos.org/options?show=users.users
{ config, lib, pkgs, ... }:

{

    users.users.datadiego = {
    isNormalUser = true;
    description = "El usuario que administra el sistema";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
