{ pkgs, ... }:
let
  unstable = import <nixpkgs-unstable> {
    inherit (pkgs) system;
    # another config, etc. if needed
  };
in {
  home-manager = {
    xdg.configFile."helix/ignore".source = ./helix-ignore;
    programs.helix = {
      enable = true;
      defaultEditor = true;
      package = unstable.helix;
      settings = {
        theme = "catppuccin_simplified";
        editor = {
          mouse = false;
          auto-save = true;
          color-modes = true;
          popup-border = "all";
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
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "rust";
          auto-pairs = {
            "(" = ")";
            "{" = "}";
            "[" = "]";
            "\"" = ''"'';
            "'" = "'";
            "`" = "`";
            "<" = ">";
          };
        }
      ];
      languages.language-server.rust-analyzer.config.check.command = "clippy";
      themes = {
        catppuccin_simplified = {
          "inherits" = "catppuccin_mocha";
          "ui.background" = { };
          "ui.popup" = {
            fg = "text";
            bg = "mantle";
          };
          "ui.help" = {
            fg = "text";
            bg = "mantle";
          };
          "ui.statusline" = {
            fg = "text";
            bg = { };
            modifiers = [ "bold " ];
          };
          "ui.statusline.inactive" = {
            fg = "text";
            bg = "mantle";
          };
          "ui.selection" = {
            bg = "mantle";
            modifiers = [ "bold" ];
          };
          "ui.text.focus" = {
            fg = "lavender";
            bg = "mantle";
            modifiers = [ "bold" ];
          };
          "ui.highlight" = {
            bg = "mantle";
            modifiers = [ "bold" ];
          };
          "ui.linenr" = { fg = "overlay2"; };
          "punctuation" = "peach";
          "ui.menu" = {
            fg = "text";
            bg = "mantle";
          };
          "ui.menu.selected" = {
            fg = "peach";
            bg = "mantle";
            modifiers = [ "bold" ];
          };
          "ui.bufferline" = {
            fg = "subtext0";
            bg = "mantle";
          };
          "ui.bufferline.active" = {
            fg = "mauve";
            bg = "mantle";
            underline = {
              color = "mauve";
              style = "line";
            };
          };
          "ui.bufferline.background" = { bg = "mantle"; };
          "ui.text.inactive" = {
            fg = "text";
            bg = "mantle";
          };
        };
      };
    };
  };
}
