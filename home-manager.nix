{ ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz".users.tadeas;
in {
  imports = [
    (import "${home-manager}/nixos")
    ./home-manager/starship.nix
    ./home-manager/fish.nix
    ./home-manager/git.nix
    ./home-manager/helix.nix
    ./home-manager/gtk.nix
    ./personal.nix
  ];
  home-manager.home.stateVersion = "23.11";

}
