{ config, pkgs, lib, hostname, ... }:

{
  imports = [
    ./applications/packages.nix
    ./shell/bash.nix
    ./shell/tmux.nix
    ./shell/ghostty.nix
    ./shell/neovim.nix
    (if hostname == "blackbridge" then ./desktop/i3.nix else ./desktop/hyprland.nix)
  ] ++ lib.optionals (hostname != "blackbridge") [
    ./desktop/hyprlock.nix
  ];
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
