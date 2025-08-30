{ config, pkgs, ... }:

{
  systemd.services.hello = {
    description = "Test de servicios";
    wantedBy = [ "multi-user.target" ];
    # ...existing code...
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash date >> /tmp/date";
      Restart = "always";
      User = "root";
    };
# ...existing code...
  };
}