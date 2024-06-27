{...}: {
  programs.helix = {
    enable = true;
    ignores = [
      "Cargo.lock"
      "flake.lock"
      "!.gitignore"
    ];
    defaultEditor = true;
  };
  imports = [
    ./helix/settings.nix
    ./helix/keybinds.nix
    ./helix/languages.nix
  ];
}
