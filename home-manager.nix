{...}: {
  home = {
    stateVersion = "23.11";
    file = {
      ".config/wiki-tui" = {
        source = ./configs/wiki-tui;
        recursive = true;
      };
      ".config/youtube-tui" = {
        source = ./configs/youtube-tui;
        recursive = true;
      };
      ".config/musikcube/settings.json".source = ./configs/musikcube/settings.json;
      ".config/musikcube/hotkeys.json".source = ./configs/musikcube/settings.json;
      ".config/musikcube/themes" = {
        source = ./configs/musikcube/themes;
        recursive = true;
      };
    };
  };
  imports = [
    ./home-manager/catppuccin.nix
    ./home-manager/foot.nix
    ./home-manager/atuin.nix
    ./home-manager/discord.nix
    ./home-manager/bat.nix
    ./home-manager/eza.nix
    ./home-manager/zsh.nix
    ./home-manager/git.nix
    ./home-manager/gtk.nix
    ./home-manager/helix.nix
    ./home-manager/starship.nix
    ./home-manager/sway.nix
    ./home-manager/xdg.nix
    ./home-manager/zellij.nix
    ./home-manager/waybar.nix
  ];
}
