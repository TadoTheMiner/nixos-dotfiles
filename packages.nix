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
    musikcube
    eartag
    spotdl
    gnome.nautilus
    (pkgs.discord.override {
      withOpenASAR = true;
    })
    libnotify
    obsidian
  ];
}
