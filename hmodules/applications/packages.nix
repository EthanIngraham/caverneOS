{ config, pkgs, lib, ... }:

{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "packettracer"
    "ciscoPacketTracer8"
  ];

  home.packages = with pkgs; [
    librewolf
    ghostty
    dmenu
    feh
    anki
  ];

}
