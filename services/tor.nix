{ config, pkgs, ... }:

{
  services.tor = {
    enable = true;           # Habilita el servicio Tor
  };
}
