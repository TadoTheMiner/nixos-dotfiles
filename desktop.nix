{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      ubuntu_font_family
      (nerdfonts.override {fonts = ["UbuntuMono"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Ubuntu"];
        sansSerif = ["Ubuntu"];
        monospace = ["UbuntuMono Nerd Font"];
      };
      subpixel.rgba = "rgb";
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-wlr xdg-desktop-portal-gtk];
    config.common.default = "*";
  };
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        libnotify
        swaybg
        libsForQt5.breeze-icons
        grim
        brightnessctl
        slurp
        cliphist
        pamixer
        playerctl
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      ];
    };
    dconf.enable = true;
    seahorse.enable = true;
  };
}
