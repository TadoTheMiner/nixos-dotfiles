{ pkgs, ... }: {
  xdg.configFile."fish/themes/catppuccin_custom.theme".source =
    ./fish/catppuccin_custom;
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        {
          name = "grc";
          src = pkgs.fishPlugins.grc.src;
        }
      ];
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

        # Git
        g = "git";
        gc = "g stage .; cz commit";
        gpu = "g push";
        gup = ''g stage .; g commit -m "update"; gpu'';
        gpl = "g pull";
        gfe = "g fetch";

        # Nix
        nrb = "sudo nixos-rebuild switch";
        ndv = "nix develop --command fish";
        nsh = "nix-shell --command fish -p";
      };
    };
    zoxide.enable = true;
  };
}
