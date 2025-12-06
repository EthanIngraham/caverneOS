{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";

      font-family = "JetBrains Mono";
      font-size = 15;

      background-opacity = 0.85;
      background-blur-radius = 20;

      font-thicken = true;

      "window-padding-x" = 10;
    };
  };
}
