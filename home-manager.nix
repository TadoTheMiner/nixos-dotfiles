{ ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ./personal.nix ];
  home-manager.users.tadeas = {
    home.stateVersion = "23.11";
    imports = [
      ./home-manager/alacritty.nix
      ./home-manager/atuin.nix
      ./home-manager/bat.nix
      ./home-manager/eza.nix
      ./home-manager/fish.nix
      ./home-manager/git.nix
      ./home-manager/gtk.nix
      ./home-manager/helix.nix
      ./home-manager/ripgrep.nix
      ./home-manager/starship.nix
      ./home-manager/sway.nix
      ./home-manager/xdg.nix
      ./home-manager/zellij.nix
    ];
  };
}
