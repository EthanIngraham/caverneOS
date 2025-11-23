{ config, pkgs, ... }:

{

  networking = {
    hostName = "blackbridge";
    networkmanager.enable = true;
    firewall.enable = true;
  };

}
