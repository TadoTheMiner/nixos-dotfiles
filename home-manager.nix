{...}: {
  home.stateVersion = "24.05";
  imports = [
    ./home-manager/atuin.nix
    ./home-manager/bat.nix
    ./home-manager/catppuccin.nix
    ./home-manager/discord.nix
    ./home-manager/foot.nix
    ./home-manager/fuzzel.nix
    ./home-manager/git.nix
    ./home-manager/gtk.nix
    ./home-manager/helix.nix
    ./home-manager/music.nix
    ./home-manager/tmux.nix
    ./home-manager/qt.nix
    ./home-manager/starship.nix
    ./home-manager/sway.nix
    ./home-manager/waybar.nix
    ./home-manager/xdg.nix
    ./home-manager/zsh.nix
  ];
}
