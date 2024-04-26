{ pkgs, ... }: {
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
        ls = "eza -a";
        ll = "eza -al --grid";
        cat = "bat";
        ln = "ln -s";
        rm = "rm -rI";
        rmf = "rm -rf";
        mdr = "mkdir -p";
        cp = "cp -r";
        cd = ''echo "use z"'';
        # Git
        g = "git";
        gc = "git stage .; cz commit";
        gcs = "git stage .; cz commit -- -S";
        gup = ''git stage .; git commit -m "update"; git push'';
        gpu = "git push";
        gpl = "git pull";

        # Nix
        nrb = "sudo nixos-rebuild switch";
        ndv = "nix develop --command fish";
        nsh = "nix-shell --command fish -p";
      };
    };
    zoxide.enable = true;
  };
}
