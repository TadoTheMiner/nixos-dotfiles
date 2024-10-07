{...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
      shellAliases = {
        l = "eza";
        ll = "eza -l";
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

    eza = {
      enable = true;
      enableNushellIntegration = true;
      icons = true;
      extraOptions = ["--no-permissions" "--no-user" "-a"];
    };

    fish.enable = true; # completions
    zoxide.enable = true;
  };
}
