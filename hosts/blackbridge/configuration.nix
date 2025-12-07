{ config, lib, pkgs, ... }:


{
  imports = [
    ./hardware-configuration.nix
    (import "${builtins.fetchTarball {
      url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    }}/nixos")

    ../../modules/system/secrets.nix
    ../../modules/system/users.nix
    ../../modules/system/nix.nix
    ../../modules/system/locale.nix
    ../../modules/system/boot.nix
    ../../modules/system/network.nix
    ../../modules/system/sops.nix
    
    ../../modules/desktop/nvidia.nix # Only blackbridge
    ../../modules/desktop/i3.nix
    ../../modules/desktop/bluetooth.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/xdg-portals.nix        
    ../../modules/desktop/themes.nix

    ../../modules/applications/gaming.nix
    ../../modules/applications/dev.nix
    ../../modules/applications/terminal.nix
    ../../modules/applications/network-tools.nix
    ../../modules/applications/desktop-apps.nix
    ../../modules/applications/media.nix
    ../../modules/applications/work.nix
    ../../modules/applications/virtualization.nix
];
 
  networking.hostName = "blackbridge";
  system.stateVersion = "24.11";

  home-manager.users.caverne = import ../../hmodules/home.nix;

}
