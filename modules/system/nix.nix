{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "spotify"
    "steam"
    "nvidia-x11"
  ];

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  #todo move
  programs.firejail.enable = true;

  home-manager.backupFileExtension = "backup";
}
