{...}: {
  home = {
    # backupFileExtension = "backup";
    stateVersion = "23.11";
    file = {
      ".local/bin" = {
        source = ./scripts;
        recursive = true;
      };
      ".config/wiki-tui" = {
        source = ./configs/wiki-tui;
        recursive = true;
      };
      ".config/youtube-tui" = {
        source = ./configs/youtube-tui;
        recursive = true;
      };
      ".config/discord/settings.json" = {
        source = ./configs/discord.json;
        recursive = true;
        force = true;
      };
    };
  };
  imports = [
    ./home-manager/kitty.nix
    ./home-manager/atuin.nix
    ./home-manager/bat.nix
    ./home-manager/eza.nix
    ./home-manager/zsh.nix
    ./home-manager/git.nix
    ./home-manager/gtk.nix
    ./home-manager/helix.nix
    ./home-manager/ripgrep.nix
    ./home-manager/starship.nix
    ./home-manager/sway.nix
    ./home-manager/xdg.nix
    ./home-manager/zellij.nix
  ];
}
