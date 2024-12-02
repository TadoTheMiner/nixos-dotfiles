{personal_info, ...}: {
  programs.git = {
    enable = true;
    userName = personal_info.name;
    userEmail = personal_info.email;
    extraConfig = {
      push.autoSetupRemote = true;
      pull.rebase = false;
      merge.tool = "meld";
      gpg.format = "ssh";
      commit.gpgSign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
