{config, ...}: {
  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    font = {
      size = 22;
      name = "Ubuntu";
    };
  };
  home.file."${config.gtk.gtk2.configLocation}".force =
    true;
}
