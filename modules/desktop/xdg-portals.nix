{ config, pkgs, ... }:

{

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [ "gnome" "gtk" ];
      };
      x-cinnamon = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" "kde" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" "kde" ];
      };
    };
  };

}
