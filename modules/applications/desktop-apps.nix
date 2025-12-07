{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    ghostty
    vscodium
    gimp
    thunderbird
    libreoffice
    pavucontrol
    flameshot
    obs-studio
    vlc
    ffmpeg
    pandoc
    swaylock-effects

    # browser
    librewolf
    firefox
    google-chrome

    dmenu
    xdotool

  ];

}
