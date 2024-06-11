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
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --time --cmd sway";
        user = "greeter";
      };
    };
  };
  #The reason we enable xorg and disable everything in it is that it makes some defaults
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xorg.xorgserver.out
      xorg.xrandr
      xorg.xrdb
      xorg.setxkbmap
      xorg.iceauth
      xorg.xlsclients
      xorg.xset
      xorg.xsetroot
      xorg.xinput
      xorg.xprop
      xorg.xauth
      pkgs.xterm
      xorg.xf86inputevdev.out
    ];
  };
}
