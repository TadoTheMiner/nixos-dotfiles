{config, ...}: {
  home = {
    stateVersion = "23.11";
    file = {
      "${config.xdg.configHome}/wiki-tui" = {
        source = ./configs/wiki-tui;
        recursive = true;
      };
      "${config.xdg.configHome}/musikcube/settings.json".source = ./configs/musikcube/settings.json;
      "${config.xdg.configHome}/musikcube/hotkeys.json".source = ./configs/musikcube/settings.json;
      "${config.xdg.configHome}/musikcube/themes" = {
        source = ./configs/musikcube/themes;
        recursive = true;
      };
    };
  };
  imports = [
    ./home-manager/atuin.nix
    ./home-manager/bat.nix
    ./home-manager/catppuccin.nix
    ./home-manager/discord.nix
    ./home-manager/eza.nix
    ./home-manager/foot.nix
    ./home-manager/fuzzel.nix
    ./home-manager/git.nix
    ./home-manager/gtk.nix
    ./home-manager/helix.nix
    ./home-manager/starship.nix
    ./home-manager/sway.nix
    ./home-manager/waybar.nix
    ./home-manager/xdg.nix
    ./home-manager/zellij.nix
    ./home-manager/zsh.nix
  ];
}
