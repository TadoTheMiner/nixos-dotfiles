{...}: {
  programs.helix = {
    enable = true;
    ignores = [
      "Cargo.lock"
      "flake.lock"
      "!.gitignore"
    ];
    defaultEditor = true;
    settings.theme = "catppuccin_simplified";
  };
  imports = [
    ./helix/theme.nix
    ./helix/settings.nix
    ./helix/keybinds.nix
    ./helix/languages.nix
  ];
}
