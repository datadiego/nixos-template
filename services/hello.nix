{ config, pkgs, ... }:

{
  systemd.services.hello-service = {
    description = "Run hello.sh periodically";
    serviceConfig = {
      ExecStart = "/etc/nixos/scripts/hello.sh";
      Restart = "always";
    };
  };

  systemd.timers.hello-service = {
    description = "Timer for hello-service";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5min";         # Espera 5 minutos después de arrancar
      OnUnitActiveSec = "10min"; # Se ejecuta cada 10 minutos
      Unit = "hello-service.service";
    };
  };
}
