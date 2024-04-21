{ pkgs, ... }:
let sddm-theme = pkgs.libsForQt5.callPackage ./sddm-theme.nix { };
in {
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    unzip
    wl-clipboard
    nil
    nixfmt
    grc
    sddm-theme
    atuin
  ];
  programs.fish.enable = true;
}
