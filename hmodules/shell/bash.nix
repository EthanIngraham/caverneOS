{ config, pkgs, ... }:

{

  programs.bash = {
    enable = true;
    shellAliases = {

      starttoolsmithvenv = "source ~/ansible-venv/bin/activate";
      cdts = "cd ~/workspace/homelab/toolsmith/src";
      cdn = "cd ~/nixos-config";
      packett = "firejail --noprofile --net=none packettracer8";
      cdcc = "cd /home/caverne/workspace/ccna/notes";
      
      nixrs = "sudo nixos-rebuild switch -I nixos-config=$HOME/nixos-config/hosts/$(hostname)/configuration.nix";
      nixrt = "sudo nixos-rebuild test -I nixos-config=$HOME/nixos-config/hosts/$(hostname)/configuration.nix";
    };
    
    sessionVariables = {
      SSH_ASKPASS = "";
      SSH_ASKPASS_REQUIRE = "never";
    };
    
    initExtra = ''
    '';
  };

}
