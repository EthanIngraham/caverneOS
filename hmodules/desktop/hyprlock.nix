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

      input-field = [{
        size = "300, 50";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        
        outer_color = "rgb(137, 180, 250)";  
        inner_color = "rgb(30, 30, 46)";    
        font_color = "rgb(205, 214, 244)"; 
        
        fade_on_empty = false;
        placeholder_text = "Enter Password...";
        
        position = "0, -120";
        halign = "center";
        valign = "center";
      }];
      
      label = [{
        text = "Hi, $USER";
        color = "rgb(205, 214, 244)";
        font_size = 25;
        font_family = "JetBrains Mono";
        
        position = "0, -40";
        halign = "center";
        valign = "center";
      }];
    };
  };
}
