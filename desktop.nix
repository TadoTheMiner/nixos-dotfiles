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
        playerctl
        wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      ];
    };
    dconf.enable = true;
    seahorse.enable = true;
  };
  services = {
    libinput.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --time --cmd sway";
          user = "greeter";
        };
      };
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs.xorg; [
        xorgserver.out
        xrandr
        xrdb
        setxkbmap
        iceauth
        xlsclients
        xset
        xsetroot
        xinput
        xprop
        xauth
        pkgs.xterm
      ];
    };
  };
}
