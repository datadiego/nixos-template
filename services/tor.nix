{ config, pkgs, ... }:

{
  services.tor = {
    enable = true;
    settings.SOCKSPort = 9050;
  };
}
