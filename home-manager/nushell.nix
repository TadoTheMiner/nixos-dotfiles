{...}: {
  programs = {
    nushell = {
      enable = true;
      shellAliases = {
        ln = "ln -s";
        rm = "rm -rI";
        rmf = "rm -rf";
        cp = "cp -r";
        cd = "z";
        cat = "bat -p";
        mdr = "mkdir";
        # Git
        g = "git";
        gp = "git push";
        gl = "git pull";
        gf = "git fetch";
        # Nix
        ndv = "nix develop --command zsh";
        nsh = "nix-shell --command zsh -p";
      };
    };

    zoxide.enable = true;
  };
}
