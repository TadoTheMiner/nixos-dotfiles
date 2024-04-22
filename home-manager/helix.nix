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
    settings = {
      theme = "catppuccin_simplified";
      editor.imports = [ ./helix/settings.nix ];
      keys.imports = [ ./helix/keybinds.nix ];

    };
    languages.imports = [ ./helix/languages.nix ];
    themes.catppuccin_simplified.imports = [ ./helix/theme.nix ];
  };
}
