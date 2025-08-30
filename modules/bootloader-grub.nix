{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.configurationLimit = 3;
}
