{ ... }: {
programs.helix.settings.editor = {
  mouse = false;
  auto-save = true;
  color-modes = true;
  popup-border = "all";
  completion-replace = true;
  statusline = {
    left = [ "mode" "spinner" "file-modification-indicator" "diagnostics" ];
    center = [ "file-base-name" "version-control" ];
    right = [ "position" "position-percentage" ];
    mode = {
      normal = "Normal";
      insert = "Insert";
      select = "Select";
    };
  };
};
}
