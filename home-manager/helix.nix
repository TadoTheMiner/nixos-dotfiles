{...}: {
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;

      ignores = [
        "Cargo.lock"
        "flake.lock"
        "!.gitignore"
      ];
    };
  };

  imports = [
    ./helix/settings.nix
    ./helix/keybinds.nix
    ./helix/languages.nix
  ];
}
