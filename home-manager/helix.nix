{ pkgs, ... }:
let
  unstable = import <nixpkgs-unstable> {
    inherit (pkgs) system;
    # another config, etc. if needed
  };
in {
  xdg.configFile."helix/ignore".text = ''
    Cargo.lock
    !.gitignore
    !personal.nix'';
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = unstable.helix;
    settings.theme = "catppuccin_simplified";
  };
  imports = [ ./helix/theme.nix ./helix/settings.nix ./helix/keybinds.nix ./helix/languages.nix];

}
