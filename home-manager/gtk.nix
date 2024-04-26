{ config, pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Peach-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "peach" ];
        variant = "mocha";
      };
    };
    iconTheme.name = "breeze-dark";
    font = {
      size = 22;
      name = "Ubuntu";
    };
  };

  # To tell home manager to shut up
  home.file."${config.gtk.gtk2.configLocation}".force = true;

  # For gtk4
  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}

