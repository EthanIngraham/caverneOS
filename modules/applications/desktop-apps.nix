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
    
    # browser
    librewolf
    firefox
    google-chrome

    # i3 related
    dmenu
    betterlockscreen
    xdotool

  ];

}
