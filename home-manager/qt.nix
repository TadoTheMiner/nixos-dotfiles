{pkgs, ...}: {
  qt = {
    enable = true;
    style.catppuccin.enable = false;
    platformTheme.name = "qtct";
  };
  home = {
    packages = [
      pkgs.qt6ct
      pkgs.libsForQt5.qt5ct
    ];
    file = {
      ".config/qt5ct/colors/Catppuccin-Mocha.conf".source = ../configs/Catppuccin-Mocha.conf;
      ".config/qt6ct/colors/Catppuccin-Mocha.conf".source = ../configs/Catppuccin-Mocha.conf;
    };
  };
}
