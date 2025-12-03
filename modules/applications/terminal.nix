{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wget
    curl
    bat
    unzip
    p7zip
    rsync
    openssh
    htop
    tmux
    fzf
    tree
    xclip
    neofetch
  ];
  
  programs.ssh.startAgent = true;

}
