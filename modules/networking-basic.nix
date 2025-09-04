{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  networking.networkmanager.settings = ''
    [main]
    dns=none

    [global-dns-domain-*]
    servers=1.1.1.1;8.8.8.8;
  '';
}
