{ ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
    ./home-manager/starship.nix
    ./home-manager/fish.nix
    ./home-manager/git.nix
    ./home-manager/helix.nix
  ];
  home-manager.users.tadeas.home.stateVersion = "23.11";

}
