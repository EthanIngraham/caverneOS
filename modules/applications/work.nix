{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ 
    zoom-us
    v4l-utils
    xdg-desktop-portal-kde
  ];

}
