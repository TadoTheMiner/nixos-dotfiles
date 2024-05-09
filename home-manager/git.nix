{ pkgs, ... }: {
  home.sessionVariables = {
    SSH_ASKPASS_REQUIRE = "prefer";
    GIT_ASKPASS = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
  };
  programs.git = {
    enable = true;
    extraConfig = {
      push.autoSetupRemote = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/signing_key.pub";
    };
  };
}
