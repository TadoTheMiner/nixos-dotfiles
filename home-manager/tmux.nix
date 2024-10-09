{...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    catppuccin.enable = false;
  };
}
