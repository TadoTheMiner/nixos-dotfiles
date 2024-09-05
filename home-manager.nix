{...}: {
  home = {
    stateVersion = "24.05";
    file = {
      ".config/wiki-tui" = {
        source = ./configs/wiki-tui;
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
    ./home-manager/music.nix
    ./home-manager/qt.nix
    ./home-manager/starship.nix
    ./home-manager/sway.nix
    ./home-manager/waybar.nix
    ./home-manager/xdg.nix
    ./home-manager/zellij.nix
    ./home-manager/zsh.nix
  ];
}
