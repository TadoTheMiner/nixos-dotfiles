{ pkgs, ... }:
let
  sddm-theme = pkgs.libsForQt5.callPackage ./packages/sddm-theme.nix { };
  bing-wallpaper-server =
    pkgs.callPackage ./packages/bing-wallpaper-server.nix { };

  rust-overlay = builtins.fetchTarball
    "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";

in {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # for obsidian
    ];
  };
  environment.systemPackages = with pkgs; [
    wget
    unzip
    wl-clipboard
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
  ];
  programs = {
    fish.enable = true;
    fzf = {
      fuzzyCompletion = true;
      keybindings = true;
    };
  };
  nixpkgs.overlays = [ (import rust-overlay) ];

}
