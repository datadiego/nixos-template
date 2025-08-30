{ config, pkgs, ... }:

{
  services.tor = {
    enable = true;
    torsocks.enable = true;
  };
}
