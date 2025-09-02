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

  # services.openvswitch.enable = true;
  services.upower.enable = true;
  nixpkgs.config.allowUnfree=true;
  services.printing.enable=true;
  services.libinput.enable=true;
  nix.extraOptions = ''
  experimental-features = nix-command flakes
'';
services.gnome.gnome-keyring.enable = true;

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
    mininet
    openvswitch
  ];
  programs.firefox.enable=true;

  system.stateVersion="25.05";
}
