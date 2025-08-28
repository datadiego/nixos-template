# ./users/user.nix
# https://search.nixos.org/options?show=users.users
{ config, lib, pkgs, ... }:

{
    users.users.wyz4rd = {
    isNormalUser = true;
    password = "1234";
  };
}
