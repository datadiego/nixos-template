{ config,pkgs,... }:

{
  imports=[ 
    ./hardware-configuration.nix 
    ./modules/bootloader-grub.nix
    ./modules/networking-basic.nix
    ./modules/lang.nix
    ./modules/desktop-i3.nix
    ./modules/audio.nix
    ./users/admin.nix
    ./services/tor.nix
    ./services/hello.nix
    ./modules/nic-asus.nix
    ./modules/virtualization.nix
    ];

  # security.wrappers.ubridge = {
  #   source = "${pkgs.ubridge}/bin/ubridge";
  #   owner = "root";
  #   group = "root";
  #   permissions = "4755";
  # };
  services.upower.enable = true;
  nixpkgs.config.allowUnfree=true;
  services.printing.enable=true;
  services.libinput.enable=true;
  nix.extraOptions = ''
  experimental-features = nix-command flakes
'';
services.gnome.gnome-keyring.enable = true;
# systemd.services.ubridge = {
#     serviceConfig = {
#       AmbientCapabilities = "CAP_NET_RAW";
#       CapabilityBoundingSet = "CAP_NET_RAW";
#       # También puedes agregar otras configuraciones necesarias
#     };
#   };
  environment.systemPackages = with pkgs; [
    pulseaudio
    arandr
    tor
	  nautilus
    brightnessctl
    home-manager
    firefox
    i3 i3blocks i3status dmenu xterm alacritty picom
    git
    discordo
  ];
  programs.firefox.enable=true;

  system.stateVersion="25.05";
}
