{...}: {
  programs = {
    zsh = {
      loginExtra = "eval $(ssh-agent); export PATH=~/.local/bin:$PATH";
      dotDir = ".config/zsh";
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "rust"];
      };
      syntaxHighlighting.enable = true;
      shellAliases = {
        # Coreutils
        ls = "eza -a --no-user --no-permissions";
        ll = "eza -al --no-user --no-permissions";
        ln = "ln -s";
        rm = "rm -rI";
        rmf = "rm -rf";
        mdr = "mkdir -p";
        cp = "cp -r";
        cd = "z";
        cat = "bat -p";
        # Git
        gc = "git add .; cz commit";
        # Nix
        nrb = "sudo nixos-rebuild switch";
        ndv = "nix develop --command zsh";
        nsh = "nix-shell --command zsh -p";
      };
    };
    fzf = {
      enable = true;
      colors = {
        "bg+" = "#313244";
        bg = "#1e1e2e";
        spinner = "#f5e0dc";
        hl = "#f38ba8";
        fg = "#cdd6f4";
        header = "#f38ba8";
        info = "#cba6f7";
        pointer = "#f5e0dc";
        marker = "#f5e0dc";
        "fg+" = "#cdd6f4";
        prompt = "#cba6f7";
        "hl+" = "#f38ba8";
      };
    };
    zoxide.enable = true;
  };
}
