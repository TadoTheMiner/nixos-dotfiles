{lib, ...}: {
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
    fzf = {
      enable = true;
      fileWidgetCommand = "rg --files";
      colors = {
        spinner = lib.mkForce "#b4befe";
        hl = lib.mkForce "#b4befe";
        header = lib.mkForce "#b4befe";
        info = lib.mkForce "#b4befe";
        pointer = lib.mkForce "#b4befe";
        marker = lib.mkForce "#b4befe";
        prompt = lib.mkForce "#b4befe";
        "hl+" = lib.mkForce "#b4befe";
      };
    };

    zoxide.enable = true;
    carapace.enable = true;
  };
}
