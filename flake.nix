{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-peach.theme.css";
      flake = false;
    };

    catppuccin.url = "github:catppuccin/nix";

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bing-wallpaper-server = {
      url = "github:TadoTheMiner/bing-wallpaper-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    zjstatus,
    catppuccin-discord,
    catppuccin,
    bing-wallpaper-server,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit bing-wallpaper-server;};
      modules = [
        ./hardware-configuration.nix
        ./desktop.nix
        ./packages.nix
        ./programming.nix
        ./utilities.nix
        ./gaming.nix
        ./firefox.nix
        ./personal.nix
        ./system.nix
        ./catppuccin.nix
        {
          nix.settings.experimental-features = ["nix-command" "flakes"];
          system.stateVersion = "23.11";
        }
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit zjstatus catppuccin-discord;
            };

            useGlobalPkgs = true;
            users.tadeas.imports = [./home-manager.nix catppuccin.homeManagerModules.catppuccin];
          };
        }
      ];
    };
  };
}
