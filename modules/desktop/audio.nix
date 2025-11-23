{ config, pkgs, ... }:

{

  # Enable PipeWire (GNOME's default audio/video server)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
