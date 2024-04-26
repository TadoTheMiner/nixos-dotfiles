{ ... }: {
  programs.git = {
    enable = true;
    extraConfig = {
      push.autoSetupRemote = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
