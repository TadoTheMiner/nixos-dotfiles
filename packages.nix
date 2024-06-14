{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0" # for obsidian
    ];
  };
  environment.systemPackages = with pkgs; [
    wiki-tui
    newsflash
    mdbook
    mpv
    htop
    youtube-tui
    (pkgs.discord.override {
      withOpenASAR = true;
    })
    spicetify-cli
    libnotify
    catppuccin-cursors.mochaDark
    obsidian
  ];
}
