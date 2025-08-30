{ config, lib, pkgs, ... }:

let
  myService = {
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash /etc/nixos/scripts/hello.sh";
    };
  };
in
{
  systemd.services.myCustomService = {
    description = "My Custom Service";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = myService.serviceConfig;
    after = [ "network.target" ];
    path = [ pkgs.bash ];
    # script removed to avoid ExecStart conflict
  };

  environment.systemPackages = [ pkgs.bash ];

  system.activationScripts.myCustomScript = ''
    echo "Hello from my custom service!" > /tmp/hello
  '';
}