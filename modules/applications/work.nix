{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ 
    zoom-us
    v4l-utils
    kdePackages.xdg-desktop-portal-kde
  ];

}
