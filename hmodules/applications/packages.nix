{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    librewolf
    ghostty
    dmenu
    feh
    anki
  ];

}
