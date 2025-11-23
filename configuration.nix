{ config, lib, pkgs, ... }:

{

  imports = [
    ./hardware-configuration.nix
    (import "${builtins.fetchTarball {
      url = "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
    }}/nixos")
    
    ./modules/system/users.nix
    ./modules/system/nix.nix
    ./modules/system/locale.nix
    ./modules/system/boot.nix
    ./modules/system/network.nix
    
    ./modules/desktop/nvidia.nix
    ./modules/desktop/i3.nix
    ./modules/desktop/bluetooth.nix
    ./modules/desktop/audio.nix
    ./modules/desktop/xdg-portals.nix        

    ./modules/applications/gaming.nix
];
  
  system.stateVersion = "24.11";

  home-manager.users.caverne = import ./home.nix;

  services.udev.extraRules = ''
  SUBSYSTEM=="video4linux", MODE="0666"
'';

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
    betterlockscreen
    tree

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

}
