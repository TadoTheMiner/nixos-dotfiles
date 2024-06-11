{pkgs, ...}: {
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
    unciv
    gnumake
    ghc
    killall
    nil
    alejandra
    grc
    gh
    obsidian
    commitizen
    wiki-tui
    newsflash
    prismlauncher
    jdk21
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
