{ config, pkgs, ... }:

{
  services.tor = {
    enable = true;           # Habilita el servicio Tor
    dataDirectory = "/var/lib/tor"; # Directorio de datos de Tor
    controlPort = "9051";    # Puerto de control de Tor
    socksPort = "9050";      # Puerto SOCKS de Tor
  };
}
