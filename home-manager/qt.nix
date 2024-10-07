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
      ".config/qt5ct/".source = ../configs/qt5ct;
      ".config/qt6ct/".source = ../configs/qt6ct;
    };
  };
}
