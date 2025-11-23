{ config, pkgs, ... }:

{
  
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; 
  services.blueman.enable = true;
  
  hardware.enableRedistributableFirmware = true;

  hardware.firmware = [ pkgs.linux-firmware ]; 

  # Force btusb module settings
  boot.extraModprobeConfig = ''
    options btusb reset=1 enable_autosuspend=0
  '';

  # Ensure Bluetooth is unblocked at boot
  systemd.services.unblock-bluetooth = {
    description = "Unblock Bluetooth at boot";
    after = [ "bluetooth.service" ];
    before = [ "bluetooth-target.target" ];
    wantedBy = [ "bluetooth.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        "${pkgs.util-linux}/bin/rfkill unblock bluetooth"
        "${pkgs.bluez}/bin/hciconfig hci0 up"
      ];
      RemainAfterExit = true;
    };
  };

}
