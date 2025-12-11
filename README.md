# NixOS Configuration

## Journey so far

<pre>
 Initial config
 Set up text editor (Nvim)
 Modular Configuration
 Home Manager
 Try i3 compositor instead of GNOME
 Build laptop 'thinkpad' via loading from my github config
 Multi Host Setup
 Move to Wayland instead of i3
 Flakes
 Reproducible dev environments on entry to repo home folder
 Secrets via Sops in secrets/

 Todo:
   Binary Caching, to build on desktop and then the laptop can use the cache to instant-load
   Custom Module Abstractions
   Nix Testing Framework
   Try Deploy-rs
</pre>

## Structure

<pre>
.
├── flake.lock
├── flake.nix
├── hmodules
│   ├── applications
│   │   └── packages.nix
│   ├── desktop
│   │   ├── hyprland.nix # using hyprland compositor
│   │   ├── hyprlock.nix 
│   │   └── i3.nix # previously used i3..
│   ├── home.nix
│   └── shell
│       ├── bash.nix # bash env setup inc aliases
│       ├── ghostty.nix
│       ├── neovim.nix # nvim setup to be improved with better lsp, telescope
│       ├── nvim
│       │   ├── after
│       │   │   └── plugin
│       │   │       ├── cmp.lua
│       │   │       ├── lsp.lua
│       │   │       └── treesitter.lua
│       │   ├── init.lua
│       │   ├── lazy-lock.json
│       │   └── lua
│       │       ├── options.lua
│       │       ├── pluginlist.lua
│       │       └── plugins.lua
│       └── tmux.nix
├── hosts
│   ├── blackbridge # desktop config
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── thinkpad # laptop config
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── modules
│   ├── applications
│   │   ├── desktop-apps.nix
│   │   ├── dev.nix
│   │   ├── gaming.nix
│   │   ├── media.nix
│   │   ├── network-tools.nix
│   │   ├── terminal.nix
│   │   ├── virtualization.nix
│   │   └── work.nix
│   ├── desktop
│   │   ├── audio.nix
│   │   ├── bluetooth.nix
│   │   ├── hyprland.nix
│   │   ├── i3.nix
│   │   ├── nvidia.nix
│   │   ├── themes.nix
│   │   └── xdg-portals.nix
│   └── system
│       ├── boot.nix
│       ├── graphics.nix
│       ├── locale.nix
│       ├── network.nix
│       ├── nix.nix
│       ├── secrets.nix
│       ├── sops.nix.backup
│       └── users.nix
├── README.md
└── secrets
    └── secrets.yaml
</pre>
