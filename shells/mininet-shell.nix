# mininet-shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.mininet
    pkgs.openvswitch
    pkgs.iproute2
    pkgs.tcpdump
    pkgs.nettools
  ];

  shellHook = ''
    echo ">>> Entorno Mininet listo"
    echo ">>> Puedes probar: sudo mn --topo=single,2 --switch=ovsk --controller=none"
  '';
}
