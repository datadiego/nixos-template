{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.networkmanager.settings = {
    main.dns = "none"; # NM no sobrescribe /etc/resolv.conf
    "global-dns-domain-".servers = "1.1.1.1;8.8.8.8;";
  };
}
