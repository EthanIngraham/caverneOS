{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "spotify"
    "steam"
    "nvidia-x11"
  ];

  nixpkgs.config.citrix_workspace = {
    sha256 = "0wgjfws5lln5ial2m5149zqbs5ddciqmbaah7iybljd5x0jbc9x7";
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  
  home-manager.backupFileExtension = "backup";
}
