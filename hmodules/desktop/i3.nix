{ config, pkgs, ... }:

{

xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      
      window = {
        titlebar = false;
        border = 1;
      };
      
      bars = [{
        position = "bottom";
        colors = {
          background = "#00000080";
        };
        statusCommand = "while date +'%H:%M'; do sleep 1; done";
      }];
      
      modes = let
        mod = "Mod4";
      in {
        "passthrough (press Mod+Escape to exit)" = {
          "${mod}+Escape" = "mode default";
        };
      };
      
      keybindings = let
        mod = "Mod4";
      in {
        # Launch apps
        "${mod}+b" = "exec librewolf";
        "${mod}+z" = "exec zoom-us";
        "${mod}+s" = "exec steam";
        "${mod}+c" = "exec selfservice";
        "${mod}+Return" = "exec ghostty";
        "${mod}+d" = "exec dmenu_run";
        "${mod}+l" = "exec betterlockscreen -l";
        "${mod}+Escape" = "mode \"passthrough (press Mod+Escape to exit)\"";
        
        # Workspace switching
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        
        # Move window to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Down" = "workspace back_and_forth";
        "${mod}+Left" = "focus output left";
        "${mod}+Right" = "focus output right";
        "${mod}+Shift+Left" = "move workspace to output left";
        "${mod}+Shift+Right" = "move workspace to output right";
        
        # Window management
        "${mod}+Shift+q" = "kill";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+Shift+e" = "exec i3-msg exit";
      };
      
      workspaceOutputAssign = [
        { workspace = "1"; output = "DP-4"; }
        { workspace = "2"; output = "DP-4"; }
        { workspace = "3"; output = "HDMI-1"; }
      ];
      
      startup = [
        { command = "feh --bg-scale ~/Pictures/the_artists_garden.jpg"; always = true; notification = false; }
      ];
    };
  };

}
