{ config, pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      image = "~/Pictures/the_artists_garden.jpg";
      
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      
      clock = true;
      datestr = "%a, %B %e";
      timestr = "%I:%M %p";
      
      text-color = "cdd6f4";
      ring-color = "89b4fa";
      key-hl-color = "a6e3a1";
      bs-hl-color = "f38ba8";
      inside-color = "1e1e2e88";
      
      fade-in = 0.2;
      grace = 2; 
      indicator-radius = 100;
      indicator-thickness = 7;
    };
  };
}
