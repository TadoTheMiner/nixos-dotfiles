{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-peach.theme.css";
      flake = false;
    };
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
    rust-overlay,
    catppuccin-discord,
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
        ./firefox.nix
        ./personal.nix
        ./system.nix
        {
          nix.settings.experimental-features = ["nix-command" "flakes"];
          system.stateVersion = "23.11";
          nixpkgs.overlays = [rust-overlay.overlays.default];
        }
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = {
              inherit zjstatus catppuccin-discord;
              system = "x86_64-linux";
            };

            useGlobalPkgs = true;
            users.tadeas = import ./home-manager.nix;
          };
        }
      ];
    };
  };
}
