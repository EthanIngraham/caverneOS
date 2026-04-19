{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  # lazy-lock.json must be writable so lazy.nvim can update it
  xdg.configFile."nvim/lazy-lock.json".enable = false;

}
