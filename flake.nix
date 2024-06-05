{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hardware-configuration.nix
        ./desktop.nix
        ./packages.nix
        ./firefox.nix
        ./personal.nix

        {
          nix.settings.experimental-features = ["nix-command" "flakes"];
          system.stateVersion = "23.11";
        }
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            users.tadeas = import ./home-manager.nix;
          };
        }
      ];
    };
  };
}
