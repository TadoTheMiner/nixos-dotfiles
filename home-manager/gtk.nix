{config, ...}: {
  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    font = {
      size = 22;
      name = "Ubuntu";
    };
    catppuccin = {
      enable = true;
      icon.enable = true;
    };
  };
  home = {
    file."${config.gtk.gtk2.configLocation}".force =
      true;
    pointerCursor = {
      size = 22;
      x11 = {
        enable = true;
        defaultCursor = "catppuccin-mocha-dark-cursors";
      };
      gtk.enable = true;
    };
  };
}
