{ pkgs, ... }:
let sddm-theme = pkgs.libsForQt5.callPackage ./sddm-theme.nix { };
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
    atuin
    gh
    obsidian
  ];
  programs.fish.enable = true;
}
