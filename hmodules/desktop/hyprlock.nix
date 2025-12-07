{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        grace = 2;
      };
      
      background = [{
        path = "/home/caverne/Pictures/the_artists_garden.jpg";
        blur_passes = 3;
      }];
    };
  };
}
