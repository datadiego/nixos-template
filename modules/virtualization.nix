{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    libvirt
    qemu
    dnsmasq
    bridge-utils
  ];

  virtualisation.libvirtd = {
    enable = true;
    # Configuración extra para permisos de socket
    extraConfig = ''
      unix_sock_group = "libvirt"
      unix_sock_ro_perms = "0777"
      unix_sock_rw_perms = "0770"
    '';
  };

  # Asegúrate de que tu usuario esté en los grupos correctos
  users.users.datadiego.extraGroups = [ "libvirtd" "libvirt" "kvm" ];

  # Asegura que el grupo kvm exista (NixOS lo crea automáticamente si usas KVM)
  # Si tienes CPU Intel o AMD, asegúrate de que el módulo esté cargado:
  boot.kernelModules = [ "kvm-intel" "kvm-amd" ];

  # Opcional: permite la gestión de redes por libvirt
  virtualisation.libvirtd.qemuPackage = pkgs.qemu_kvm;
}