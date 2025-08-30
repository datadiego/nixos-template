{
  networking.usePredictableInterfaceNames = false;

  systemd.network.links = {
    "10-custom-eth0" = {
      matchConfig.MACAddress = "d4:5d:64:62:c3:9b";
      linkConfig.Name = "eth0";
    };

    "10-custom-wlan0" = {
      matchConfig.MACAddress = "70:66:55:cf:27:8f";
      linkConfig.Name = "wlan0";
    };
  };

  
}
