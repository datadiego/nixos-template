{ config, pkgs, ... }:

{
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.configurationLimit = 3;
}
