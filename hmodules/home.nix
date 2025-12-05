{ config, pkgs, ... }:

{

  imports = [
    ./applications/packages.nix
    ./desktop/i3.nix
    ./shell/bash.nix
    ./shell/tmux.nix
    ./shell/ghostty.nix
    ./shell/neovim.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

}
