{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {

      background = "1e1e2e";
      foreground = "cdd6f4";
      
      palette = [
        # Black
        "0=#45475a"
        "8=#585b70"
        
        # Red
        "1=#f38ba8"
        "9=#f38ba8"
        
        # Green
        "2=#a6e3a1"
        "10=#a6e3a1"
        
        # Yellow
        "3=#f9e2af"
        "11=#f9e2af"
        
        # Blue
        "4=#89b4fa"
        "12=#89b4fa"
        
        # Magenta
        "5=#f5c2e7"
        "13=#f5c2e7"
        
        # Cyan
        "6=#94e2d5"
        "14=#94e2d5"
        
        # White
        "7=#bac2de"
        "15=#a6adc8"
      ];

      font-family = "JetBrains Mono";
      font-size = 15;

      background-opacity = 0.85;
      background-blur-radius = 20;

      font-thicken = true;

      "window-padding-x" = 10;
    };
  };
}
