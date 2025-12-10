{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Neovim
    neovim    
    lua-language-server
    pyright
    ruff
    black
    
    # Development tools
    git
    gcc
    gnumake
    python3
    python3Packages.pip
    nodejs
    rustup
    
    # Ansible
    ansible
    ansible-lint

    unityhub

    sops
    age
    direnv
  ];

  programs.neovim = {
    enable = true;
  }; 
}
