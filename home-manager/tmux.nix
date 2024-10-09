{...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    catppuccin.extraConfig = builtins.readFile ./catppuccin-tmux.conf;
  };
}
