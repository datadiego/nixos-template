{ config, pkgs, ... }:

{
  systemd.services.hello-service = {
    description = "My Hello NixOS Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "/etc/nixos/scripts/hello.sh";
      Restart = "always";
    };
  };
}
