{ config, pkgs, ... }:

{
  # Explicitly disable X11 and i3
  services.xserver.enable = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Use greetd instead of SDDM
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "caverne";
      };
    };
  };

  # Disable SDDM
  services.displayManager.sddm.enable = false;

  services.picom.enable = false;

  environment.systemPackages = with pkgs; [
    rofi
    wl-clipboard
    grim
    slurp
    mako
    hyprpaper
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
