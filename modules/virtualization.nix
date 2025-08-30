{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    libvirt
    qemu
    dnsmasq
    bridge-utils
  ];

  virtualisation.libvirtd.enable = true;

  # Asegúrate de que tu usuario esté en el grupo libvirtd
  users.users.tu_usuario.extraGroups = [ "libvirtd" ];

  # Opcional: permisos para conexiones sin autenticación (solo si es máquina local)
  virtualisation.libvirtd.extraConfig = ''
    unix_sock_group = "libvirtd"
    unix_sock_ro_perms = "0770"
    unix_sock_rw_perms = "0770"
  '';
}
