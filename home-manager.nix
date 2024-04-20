{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ./home-manager/starship.nix ];
  home-manager.users.tadeas = {
    home.stateVersion = "23.11";

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [
        # Enable a plugin (here grc for colorized command output) from nixpkgs
        {
          name = "grc";
          src = pkgs.fishPlugins.grc.src;
        }
      ];
    };
    programs.git = {
      enable = true;
      extraConfig.push.autoSetupRemote = true;

    };

    programs.helix = {
      enable = true;
      settings = {
        theme = "catppuccin_simplified";
        editor = {
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          mouse = false;
          auto-save = true;
          color-modes = true;
          shell = [ "${pkgs.fish}/bin/fish" "-c" ];
          completion-replace = true;
          statusline = {
            left =
              [ "mode" "spinner" "file-modification-indicator" "diagnostics" ];
            center = [ "file-base-name" "version-control" ];
            right = [ "position" "position-percentage" ];
            mode = {
              normal = "Normal";
              insert = "Insert";
              select = "Select";
            };
          };
        };
        keys = {
          normal = {
            "C-A-q" = [ ":qa!" ];
            "C-s" = [ ":w" ];
          };
          insert = {
            "esc" = [ "normal_mode" ":w" ];
            "C-A-q" = [ ":qa!" ];
            "C-s" = [ ":w" ];
          };
        };

      };
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }];
      themes = {
        catppuccin_simplified = {
          "inherits" = "catppuccin_mocha";
          "ui.background" = { };
        };
      };
    };
  };

}
