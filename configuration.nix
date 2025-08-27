{ config,pkgs,... }:

{
  imports=[ 
    ./hardware-configuration.nix 
    ./modules/bootloader.nix
    ./modules/networking-basic.nix
    ./modules/lang.nix
    ./modules/desktop-i3.nix
    ./modules/audio.nix
    ];

  services.upower.enable = true;
  nixpkgs.config.allowUnfree=true;
  services.printing.enable=true;
  services.libinput.enable=true;

  users.users.datadiego={
    isNormalUser=true;
    description="El usuario que administra el sistema";
    extraGroups=[ "networkmanager" "wheel"];
  };

  environment.systemPackages = with pkgs; [
	nautilus
    home-manager
    wget
    firefox
    i3 i3blocks i3status dmenu xterm alacritty
    git 
  ];
  programs.firefox.enable=true;

  system.stateVersion="25.05";
}
