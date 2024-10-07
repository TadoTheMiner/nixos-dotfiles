{...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
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
        ndv = "nix develop --command nu";
        nsh = "nix-shell --command nu -p";
      };
    };

    zoxide.enable = true;
  };
}
