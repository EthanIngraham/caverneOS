{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Add Windows to boot menu for Dual Boot
  boot.loader.grub.useOSProber = true;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelModules = [ "uvcvideo" "snd-usb-audio" "bluetooth" "btusb"];

  boot.initrd.compressor = "gzip";
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [ "btusb.enable_autosuspend=0" ];

}
