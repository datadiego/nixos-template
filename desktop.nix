{ config, pkgs, ... }:

{
   # configuración de escritorio
  services.xserver = {
  	enable=true;
  	displayManager.lightdm.enable=false;
    windowManager.i3.package=pkgs.i3-gaps;
    windowManager.i3.enable=true;
	  videoDrivers = [ "modesetting" ];
	  displayManager.sessionCommands = ''
	  xrandr --output Virtual-1 --mode 1920x1200
	  '';
  };
  services.displayManager.ly.enable=true;
}
