{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/secrets.nix
    ../../modules/system/users.nix
    ../../modules/system/nix.nix
    ../../modules/system/locale.nix
    ../../modules/system/boot.nix
    ../../modules/system/network.nix

    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/bluetooth.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/xdg-portals.nix        
    ../../modules/desktop/themes.nix

    ../../modules/applications/dev.nix
    ../../modules/applications/terminal.nix
    ../../modules/applications/network-tools.nix
    ../../modules/applications/desktop-apps.nix
    ../../modules/applications/media.nix
    ../../modules/applications/work.nix
    ../../modules/applications/virtualization.nix
    ../../modules/applications/gaming.nix
];
 
  networking.hostName = "thinkpad";
  system.stateVersion = "24.11";

  home-manager.users.caverne = import ../../hmodules/home.nix;

}
