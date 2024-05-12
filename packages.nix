{ pkgs, ... }:
let
  sddm-theme = pkgs.libsForQt5.callPackage ./packages/sddm-theme.nix { };
  bing-wallpaper-server =
    pkgs.callPackage ./packages/bing-wallpaper-server.nix { };

  rust-overlay = builtins.fetchTarball
    "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  unstable = import <nixpkgs-unstable> { inherit (pkgs) system; };
  zjstatus = pkgs.callPackage ./packages/zjstatus.nix { };
in {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # for obsidian
    ];
  };
  environment.systemPackages = (with pkgs; [
    unzip
    nil
    nixfmt
    grc
    sddm-theme
    gh
    obsidian
    commitizen
    bing-wallpaper-server
    wiki-tui
    newsflash
    prismlauncher
    jdk21
    zjstatus
    mdbook
    mpv
    meld
    youtube-tui
    catppuccin-cursors.mochaDark
  ]) ++ [ unstable.spicetify-cli ];

  services.flatpak.enable = true;
  programs = {
    steam.enable = true;
    fish.enable = true;
    fzf = {
      fuzzyCompletion = true;
      keybindings = true;
    };
  };
  nixpkgs.overlays = [ (import rust-overlay) ];
}
