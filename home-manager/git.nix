{ ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];
  home-manager.users.tadeas.programs.git = {
    enable = true;
    extraConfig.push.autoSetupRemote = true;
  };
}
