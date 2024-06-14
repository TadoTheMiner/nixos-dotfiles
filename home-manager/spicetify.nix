{
  pkgs,
  spicetify,
  ...
}: let
  spicePkgs = spicetify.packages.${pkgs.system}.default;
in {
  imports = [spicetify.homeManagerModule];
  # configure spicetify :)
  programs.spicetify = {
    enable = true;

    # custom Dribbblish theme
    theme = spicePkgs.themes.Dribbblish;
    colorScheme = "custom";
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
    ];
    customColorScheme = {
      text = "cdd6f4";
      subtext = "cdd6f4";
      sidebar-text = "cdd6f4";
      main = "11111b";
      sidebar = "1e1e2e";
      player = "11111b";
      card = "1e1e2e";
      shadow = "00000000";
      selected-row = "6c7086";
      button = "fab387";
      button-active = "fab387";
      button-disabled = "6c7086";
      tab-active = "6c7086";
      notification = "fab387";
      notification-error = "f38ba8";
      misc = "fab387";
    };
    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      keyboardShortcut
      adblock
      historyShortcut
      hidePodcasts
    ];
  };
}
