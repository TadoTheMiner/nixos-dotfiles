{ ... }: {
  programs.git = {
    enable = true;
    extraConfig.push.autoSetupRemote = true;
  };
}
