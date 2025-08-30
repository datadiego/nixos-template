{ config, pkgs, ... }:

{
  services.tor = {
    enable = false;           # Habilita el servicio Tor
  };
}
