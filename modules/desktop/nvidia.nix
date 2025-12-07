{ config, pkgs, ... }:

{

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Force X11 instead of Wayland todo:remove
  services.displayManager.gdm.wayland = false;
  
  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --primary --auto --pos 0x0 --output HDMI-0 --auto --pos 1920x0
  '';

}
