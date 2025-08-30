{
  networking.usePredictableInterfaceNames = false;

  systemd.network.links = {
    "10-custom-eth0" = {
      matchConfig.MACAddress = "28:d2:44:32:da:28";
      linkConfig.Name = "eth0";
    };

    "10-custom-wlan0" = {
      matchConfig.MACAddress = "5c:51:4f:88:7d:c2";
      linkConfig.Name = "wlan0";
    };
  };
}
