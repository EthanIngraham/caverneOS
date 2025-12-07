{ config, pkgs, lib, ... }:

{

  imports = [
    ./applications/packages.nix
    ./desktop/hyprland.nix
    ./shell/bash.nix
    ./shell/tmux.nix
    ./shell/ghostty.nix
    ./shell/neovim.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.pointerCursor = lib.mkForce {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
