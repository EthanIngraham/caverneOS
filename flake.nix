{
  description = "NixOS configuration for thinkpad and blackbridge";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }: {
    nixosConfigurations = {
      
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/thinkpad/configuration.nix
          sops-nix.nixosModules.sops
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.caverne = import ./hmodules/home.nix;
              
              # This prevents home-manager from setting defaults that conflict
              backupFileExtension = "backup";
            };
          }
        ];
      };
      
      blackbridge = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/blackbridge/configuration.nix
          sops-nix.nixosModules.sops
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.caverne = import ./hmodules/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
      
    };
  };
}
