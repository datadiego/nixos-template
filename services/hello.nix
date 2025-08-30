{ config, pkgs, ... }:

let
  helloScript = pkgs.writeShellScript "hello.sh" ''
    date >> /tmp/hello.log
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