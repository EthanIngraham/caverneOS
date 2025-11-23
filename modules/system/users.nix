{ config, pkgs, ... }:

{

  users.users.caverne = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    initialPassword = "password";
  };

}
