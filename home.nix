{ config, pkgs, ... }:

{

  imports = [
    ./hmodules/applications/packages.nix
    ./hmodules/applications/anki/anki.nix
    ./hmodules/desktop/i3.nix
    ./hmodules/shell/bash.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

}
