# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    (import "${builtins.fetchTarball {
      url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    }}/nixos")
  ];
  
  system.stateVersion = "24.11";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Add Windows to boot menu for Dual Boot
  boot.loader.grub.useOSProber = true;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelModules = [ "uvcvideo" "snd-usb-audio" "bluetooth" "btusb"];

  services.udev.extraRules = ''
  SUBSYSTEM=="video4linux", MODE="0666"
'';

  # Ensure your partitions are identified
#  fileSystems."/boot" = {
#    device = "/dev/nvme0n1p1";
#    fsType = "vfat";
#  };

#  fileSystems."/" = {
#    device = "/dev/nvme0n1p6";
#    fsType = "ext4";
#  };

#  swapDevices = [ { device = "/dev/nvme0n1p5"; } ];

  # Set your language and locale preferences
  i18n.defaultLocale = "en_GB.UTF-8";  # British English
  
  # Additional locales if needed
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  
  # Console settings
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";  # For UK keyboard
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;  # Optional: auto-power on at boot
  services.blueman.enable = true;  # Bluetooth manager GUI
  
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

  boot.initrd.compressor = "gzip";
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [ "btusb.enable_autosuspend=0" ];

  programs.gamemode.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

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

  # Force X11 instead of Wayland
  services.xserver.displayManager.gdm.wayland = false;
  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output DP-4 --primary --auto --pos 0x0 --output HDMI-0 --auto --pos 1920x0
  '';


  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
    ];
    # Explicitly configure which portal to use for which interface
    config = {
      common = {
        default = [ "gnome" "gtk" ];
      };
      # Allow KDE portal for screen capture specifically
      x-cinnamon = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" "kde" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" "kde" ];
      };
    };
  };

  # Enable PipeWire (GNOME's default audio/video server)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  networking = {
    hostName = "blackbridge";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  users.users.caverne = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
    initialPassword = "password";
  };

  time.hardwareClockInLocalTime = true;

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "discord"
      "spotify"
      "steam"
    ];
  };

  nixpkgs.config.citrix_workspace = {
    sha256 = "0wgjfws5lln5ial2m5149zqbs5ddciqmbaah7iybljd5x0jbc9x7";
  };

  environment.systemPackages = with pkgs;  [
    wget
    curl
    bat
    unzip
    p7zip
    rsync
    openssh
    firefox
    google-chrome
    git
    htop
    tmux
    fzf
    vscodium
    gimp
    ghostty
    xdotool
    streamlink
    mpv
    twitch-tui
    xclip
    librewolf
    dmenu

    citrix_workspace 
    zoom-us
    v4l-utils
    xdg-desktop-portal-kde


    # -- NEOVIM

    neovim    
    lua-language-server

    # Python LSP and tools
    pyright              # Python LSP server
    ruff                 # Fast Python linter/formatter
    black                # Python formatter (alternative)
  
    # Ansible
    ansible
    ansible-lint         # Ansible linting
  
    # Network automation tools
    sshpass              # SSH password authentication
    openssh              # SSH client
    netcat               # Network debugging
    nmap                 # Network scanning
    wireshark            # Packet analysis
    tcpdump              # Packet capture

    # --

    nmap
    traceroute
    bind
    networkmanager
    networkmanagerapplet

    thunderbird
    libreoffice
    pavucontrol
    flameshot
    obs-studio
    vlc
    ffmpeg

    gcc
    gnumake
    python3
    python3Packages.pip
    nodejs
    rustup

    discord
    spotify   
    steam
 
    pandoc

    papirus-icon-theme
    arc-theme
  ];

  # Neovim plugins
  programs.neovim = {
    enable = true;
  }; 
 
  programs.ssh.startAgent = true;

  home-manager.backupFileExtension = "backup";

  # Configure Home Manager for your user
  home-manager.users.caverne = { pkgs, ... }: {
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    librewolf
    ghostty
    dmenu
    feh  # Make sure this is here
  ];
  
  xsession.windowManager.i3 = {
    enable = true;
    
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      bars = [];

    window = {
      titlebar = false;
      border = 1;
    };

      keybindings = let
        mod = "Mod4";
      in {
        # Launch apps (but only when you press the key)
  "${mod}+b" = "exec librewolf";
  "${mod}+z" = "exec zoom-us";
  "${mod}+c" = "exec selfservice";  # Citrix Workspace
  "${mod}+Return" = "exec ghostty";
  "${mod}+d" = "exec dmenu_run";
  
  # Switch to workspace (just goes there, doesn't launch anything)
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

  "${mod}+Shift+Left" = "move workspace to output left";
  "${mod}+Shift+Right" = "move workspace to output right";

  # Window management
  "${mod}+Shift+q" = "kill";
  "${mod}+f" = "fullscreen toggle";
  "${mod}+Shift+e" = "exec i3-msg exit";
      };

      
      startup = [
        { command = "feh --bg-scale ~/Pictures/lockscreen.jpg"; always = true; notification = false; }
      ];
    };
  };
};
}
  
  



