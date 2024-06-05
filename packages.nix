{pkgs, ...}: let
  sddm-theme = pkgs.libsForQt5.callPackage ./packages/sddm-theme.nix {};
  bing-wallpaper-server =
    pkgs.callPackage ./packages/bing-wallpaper-server.nix {};
  zjstatus = pkgs.callPackage ./packages/zjstatus.nix {};
in {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # for obsidian
    ];
  };
  environment.systemPackages = with pkgs; [
    unzip
    networkmanagerapplet
    jq
    gnumake
    ghc
    killall
    nil
    alejandra
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
    htop
    youtube-tui
    rustup
    cargo-nextest
    cargo-make
    gcc
    bacon
    (pkgs.discord.override {
      # remove any overrides that you don't want
      withOpenASAR = true;
    })
    spicetify-cli
    nasm
    libnotify
    catppuccin-cursors.mochaDark
  ];
  services.flatpak.enable =
    true;
  programs = {
    steam.enable = true;
    zsh.enable = true;
  };
}
