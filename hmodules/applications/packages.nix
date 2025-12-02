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
    (ciscoPacketTracer8.override {
      packetTracerSource = /home/caverne/nixos-config/hmodules/applications/packettracer/CiscoPacketTracer822_amd64_signed.deb;
    })
    anki
  ];

}
