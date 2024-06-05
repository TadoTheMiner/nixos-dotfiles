{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Peach-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["peach"];
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 22;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    iconTheme.name = "breeze-dark";
    font = {
      size = 22;
      name = "Ubuntu";
    };
  };
  home = {
    file."${config.gtk.gtk2.configLocation}".force =
      true; # To tell home manager to shut up
    pointerCursor = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = "Catppuccin-Mocha-Dark-Cursors";
      };
    };
  };

  # For gtk4
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
