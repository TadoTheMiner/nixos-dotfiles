{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      mouse_mode = false;
      pane_frames = false;
      simplified_ui = true;

    };
  };
}
