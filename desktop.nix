{ pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      ubuntu_font_family
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
      subpixel.rgba = "rgb";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  programs.dconf.enable = true;
  services.xserver = {
    enable = true;

    # Bloatware
    excludePackages = [ pkgs.xterm ];

    displayManager = {
      defaultSession = "plasmawayland";
      sddm = {
        enable = true;
        theme = "sddm-theme";
        settings = {
          Theme = { CursorTheme = "Catppuccin-Mocha-Dark-Cursors"; };
        };
      };
    };
    desktopManager.plasma5.enable = true;
  };

}
