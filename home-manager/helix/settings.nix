{ ... }: {
  programs.helix.settings.editor = {
    mouse = false;
    auto-save = true;
    color-modes = true;
    popup-border = "all";
    completion-replace = true;
    statusline = {
      left = [
        "mode"
        "spinner"
        "file-modification-indicator"
        "separator"
        "diagnostics"
      ];
      center = [ "file-base-name" ];
      right = [ "position" ];
      mode = {
        normal = "Normal";
        insert = "Insert";
        select = "Select";
      };
    };
  };
}
