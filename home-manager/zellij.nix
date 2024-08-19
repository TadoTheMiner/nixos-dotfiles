{
  config,
  zjstatus,
  pkgs,
  ...
}: let
  default-tab-template = ''
    default_tab_template {
          children
          pane size=2 borderless=true {
            plugin location="zellij:status-bar"
          }
          pane size=1 borderless=true {
              plugin location="file://${zjstatus.packages.${pkgs.system}.default}/bin/zjstatus.wasm" {
                  format_left   "#[fg=#b4befe,bold]{session}"
                  format_center "{tabs}"
                  format_right  "{command_git_branch} {datetime}"
                  format_space  ""

                  border_enabled  "false"
                  hide_frame_for_single_pane "false"

                  mode_normal  "#[bg=#b4befe] "

                  tab_normal   "#[fg=#6C7086] {name} "
                  tab_active   "#[fg=#b4befe,bold,italic] {name} "

                  command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
                  command_git_branch_format      "#[fg=blue] {stdout} "
                  command_git_branch_interval    "10"
                  command_git_branch_rendermode  "static"

                  datetime        "#[fg=#6C7086] {format} "
                  datetime_format "%a, %d %b %Y %H:%M"
                  datetime_timezone "Europe/Berlin"
            }
        }
    }
  '';
in {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      mouse_mode = false;
      pane_frames = false;
      simplified_ui = true;
      session_serialization = false;
    };
  };

  # Layouts
  home.file = {
    "${config.xdg.configHome}/zellij/layouts/default.kdl".text = ''
      layout {${default-tab-template}}'';
    "${config.xdg.configHome}/zellij/layouts/programming.kdl".text = ''
      layout {
            ${default-tab-template}
            tab name="helix" {
              pane command="hx"
            }
            tab name="zsh"
      }'';
    ".cache/zellij/permissions.kdl" = {
      text = "\"/nix/store/5hxi3vajjkc5l8hbbaj3p5k6km82s7b4-zjstatus-0.15.0/bin/zjstatus.wasm\" {
      RunCommands
      ReadApplicationState
      ChangeApplicationState
    }";
      force = true;
    };
  };
}
