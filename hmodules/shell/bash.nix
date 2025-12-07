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
      
      nixrs = "sudo nixos-rebuild switch --flake $HOME/nixos-config#$(hostname)"; 
      nixrt = "sudo nixos-rebuild test --flake $HOME/nixos-config#$(hostname)";

    };
    
    sessionVariables = {
      SSH_ASKPASS = "";
      SSH_ASKPASS_REQUIRE = "never";
    };

    initExtra = ''
      # Auto-attach to my tmux session
      if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        if tmux has-session -t caverne 2>/dev/null; then
          exec tmux attach-session -t caverne
        fi
      fi
    '';  
  };

}
