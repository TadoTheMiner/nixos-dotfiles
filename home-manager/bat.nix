{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = { theme = "catppuccin"; };
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat"; # Bat uses sublime syntax for its themes
          rev = "b8134f01b0ac176f1cf2a7043a5abf5a1a29457b";
          sha256 = "sha256-gzf0/Ltw8mGMsEFBTUuN33MSFtUP4xhdxfoZFntaycQ=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };
}

