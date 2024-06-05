{pkgs, ...}: let
  zjstatus = pkgs.callPackage ../packages/zjstatus.nix {};
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
  xdg.configFile = {
    "zellij/layouts/default.kdl".text = ''
        layout {
              default_tab_template {
                children
                pane size=2 borderless=true {
                  plugin location="zellij:status-bar"
                }
                pane size=1 borderless=true {
                    plugin location="file://${zjstatus}/zjstatus.wasm" {
                        format_left   "#[fg=#fab387,bold]{session}"
                        format_center "{tabs}"
                        format_right  "{command_git_branch} {datetime}"
                        format_space  ""

                        border_enabled  "false"
                        hide_frame_for_single_pane "false"

                        mode_normal  "#[bg=#fab387] "
                   
                        tab_normal   "#[fg=#6C7086] {name} "
                        tab_active   "#[fg=#fab387,bold,italic] {name} "

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
        tab
      }'';
    "zellij/layouts/programming.kdl".text = ''
                    layout {
                          default_tab_template {
                              children
                              pane size=2 borderless=true {
                                plugin location="zellij:status-bar"
                              }
                              pane size=1 borderless=true {
                                  plugin location="file://${zjstatus}/zjstatus.wasm" {
                                      format_left   "#[fg=#fab387,bold]{session}"
                                      format_center "{tabs}"
                                      format_right  "{command_git_branch} {datetime}"
                                      format_space  ""

                                      border_enabled  "false"
                                      hide_frame_for_single_pane "false"

                                      mode_normal  "#[bg=#fab387] "
                                 
                                      tab_normal   "#[fg=#6C7086] {name} "
                                      tab_active   "#[fg=#fab387,bold,italic] {name} "

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
      tab name="helix" {
        pane command="hx"
      }
      tab name="zsh"
                            
                  }'';
  };
}
