{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = ",preferred,auto,1";
      
      # Startup applications
      exec-once = [
#        "hyprctl setcursor Adwaita"
        "hyprpaper"
        "waybar"
        "[workspace 1 silent] librewolf"
        "[workspace 2 silent] ghostty"
      ];

      # Input configuration
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };

      # General settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee)";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };
      
      env = [
#        "XCURSOR_THEME,Adwaita"
#        "XCURSOR_SIZE,24"
      ];

      # Decoration
      decoration = {
        rounding = 0;
        blur = {
          enabled = false;
        };
        shadow = {
          enabled = false;
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 5, default"
          "workspaces, 1, 4, default"
        ];
      };

      # Keybindings
      "$mod" = "SUPER";
      
      bind = [
        # Launch apps
        "$mod, b, exec, librewolf"
        "$mod, z, exec, zoom-us"
        "$mod, s, exec, steam"
        "$mod, c, exec, selfservice"
        "$mod, Return, exec, ghostty"
        "$mod, d, exec, rofi -show drun"
        "$mod, l, exec, swaylock"

        # Window management
        "$mod SHIFT, q, killactive,"
        "$mod, f, fullscreen,"
        "$mod SHIFT, e, exit,"

        # Workspace switching
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Multi-monitor navigation (only active when multiple monitors present)
        "$mod, Left, focusmonitor, l"
        "$mod, Right, focusmonitor, r"
        "$mod SHIFT, Left, movecurrentworkspacetomonitor, l"
        "$mod SHIFT, Right, movecurrentworkspacetomonitor, r"
        
        # Workspace back and forth
        "$mod, Down, workspace, previous"

        # Focus movement
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/the_artists_garden.jpg" ];
      wallpaper = [ ",~/Pictures/the_artists_garden.jpg" ];
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [];
        modules-right = [ "battery" "clock" ];

        clock = {
          format = "{:%H:%M}";
          interval = 1;
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
          states = {
            warning = 30;
            critical = 15;
          };
        };
      };
    };
    style = ''
      * {
        font-family: monospace;
        font-size: 13px;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0.5);
        color: #ffffff;
      }

      #workspaces button {
        padding: 0 5px;
        color: #ffffff;
      }

      #workspaces button.active {
        background-color: rgba(255, 255, 255, 0.2);
      }

      #clock, #battery {
        padding: 0 10px;
      }

      #battery.warning {
        color: #f0c674;
      }

      #battery.critical {
        color: #cc6666;
      }
      #tray {
        padding: 0 10px;
      }
    '';
  };
}
