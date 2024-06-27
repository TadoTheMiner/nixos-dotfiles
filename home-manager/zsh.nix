{...}: {
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      syntaxHighlighting.enable = true;
      shellAliases = {
        # Coreutils
        ls = "eza -a --no-user --no-permissions";
        ll = "eza -al --no-user --no-permissions";
        ln = "ln -s";
        rm = "rm -rI";
        rmf = "rm -rf";
        cp = "cp -r";
        cd = "z";
        cat = "bat -p";
        mdr = "mkdir -p";
        # Git
        g = "git";
        gc = "git add .; cz commit";
        gp = "git push";
        gl = "git pull";
        gf = "git fetch";
        gup = "git add .; git commit -m update";
        # Nix
        nrb = "sudo nixos-rebuild switch";
        ndv = "nix develop --command zsh";
        nsh = "nix-shell --command zsh -p";
      };
    };
    fzf.enable = true;

    zoxide.enable = true;
    carapace.enable = true;
  };
}
