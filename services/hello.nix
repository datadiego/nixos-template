{ config, pkgs, ... }:

let
  helloScript = pkgs.writeShellScript "/home/datadiego/nixos-template/scripts/hello.sh" ''
    echo "Hello from systemd service at $(date)" >> /tmp/hello.log
  '';
in
{
  systemd.services.hello-service = {
    description = "Run hello.sh periodically";
    serviceConfig = {
      ExecStart = "${helloScript}";
      #Restart = "always";
    };
  };

  systemd.timers.hello-service = {
    description = "Timer for hello-service";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5min";
      OnUnitActiveSec = "10min";
      Unit = "hello-service.service";
    };
  };
}