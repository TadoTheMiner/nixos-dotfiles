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

  programs.firefox = {
    enable = true;
    preferences = { "widget.use-xdg-desktop-portal.file-picker" = 1; };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  programs.dconf.enable = true;
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    displayManager.sddm = {
      enable = true;
      theme = "sddm-theme";
    };
    desktopManager.plasma5.enable = true;
  };

}
