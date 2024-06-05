{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      ubuntu_font_family
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Ubuntu"];
        sansSerif = ["Ubuntu"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
      subpixel.rgba = "rgb";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk];
  };
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        swaybg
        libsForQt5.breeze-icons
        grim
        brightnessctl
        slurp
        cliphist
        pamixer
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      ];
    };
    dconf.enable = true;
    seahorse.enable = true;
  };
  services.displayManager = {
    defaultSession = "sway";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sddm-theme";
      settings.Theme.CursorTheme = "Catppuccin-Mocha-Dark-Cursors";
    };
  };
}
