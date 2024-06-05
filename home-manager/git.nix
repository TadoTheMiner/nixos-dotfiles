{...}: {
  programs.git = {
    enable = true;
    userName = "Tadeas Uradnik";
    userEmail = "taduradnik@gmail.com";
    extraConfig = {
      push.autoSetupRemote = true;
      merge.tool = "meld";
      gpg.format = "ssh";
      commit.gpgSign = "true";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
