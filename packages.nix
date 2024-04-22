{ pkgs, ... }:
let
  sddm-theme = pkgs.libsForQt5.callPackage ./packages/sddm-theme.nix { };
  bing-wallpaper-server =
    pkgs.callPackage ./packages/bing-wallpaper-server.nix { };
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
    bing-wallpaper-server
  ];
  programs.fish.enable = true;
}
