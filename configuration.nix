{ config,pkgs,... }:

{
  imports=[ 
    ./hardware-configuration.nix 
    ./modules/bootloader.nix
    ./modules/networking-basic.nix
    ./modules/lang.nix
    ./modules/desktop-i3.nix
    ./modules/audio.nix
    ./users/user-example.nix
    ./users/admin.nix
    ];

  services.upower.enable = true;
  nixpkgs.config.allowUnfree=true;
  services.printing.enable=true;
  services.libinput.enable=true;



  environment.systemPackages = with pkgs; [
	  nautilus 
    brightnessctl
    home-manager
    wget
    firefox
    i3 i3blocks i3status dmenu xterm alacritty picom
    git 
  ];
  programs.firefox.enable=true;

  system.stateVersion="25.05";
}
