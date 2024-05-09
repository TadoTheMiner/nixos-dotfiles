{ lib, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [{ command = "waybar"; }];
      modifier = "Mod4";
      keybindings = lib.mkOptionDefault {
        "XF86MonBrightnessDown" = "exec brightnessctl -q set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl -q set 5%+";

      };
      # Use kitty as default terminal
      terminal = "alacritty";
      startup = [
        {
          command = "swaybg -c \\#1e1e2e";
        }
        # Launch Firefox on start
        { command = "firefox"; }
      ];
      window = {
        titlebar = false;
        border = 5;
      };
      gaps.smartBorders = "on";
      menu = "wofi --show drun | xargs swaymsg exec --";
      colors.background = "1e1e2e";
      colors.focused = {
        background = "1e1e2e";
        border = "fab387";
        childBorder = "fab387";
        indicator = "fab387";
        text = "cdd6f4";
      };
      colors.focusedInactive = {
        background = "1e1e2e";
        border = "b4befe";
        childBorder = "b4befe";
        indicator = "b4befe";
        text = "cdd6f4";
      };
      colors.unfocused = {
        background = "1e1e2e";
        border = "1e1e2e";
        childBorder = "1e1e2e";
        indicator = "1e1e2e";
        text = "cdd6f4";
      };
    };
  };

  programs = {
    waybar = {
      enable = true;
      style = (builtins.readFile ./waybar.css);
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          output = [ "eDP-1" ];
          margin-bottom = 10;
          modules-left = [ "sway/workspaces" "sway/mode" ];
          modules-center = [ "clock" ];
          modules-right =
            [ "sway/language" "network" "battery" "backlight" "pulseaudio" ];
          network = {
            interface = "wlp0s20f3";
            format-wifi =
              "<span color='#fab387'>   {signalStrength}%</span> {essid}";
            format-disconnected = "<span color='#f38ba8'>󰖪 </span>No Network";
            tooltip = false;
          };
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            disable-click = true;
            format = "{icon} {name}";
            format-icons = {
              urgent = "<span color='#f38ba8'></span>";
              focused = "<span color='#fab387'></span>";
              default = "";
            };
          };

          "sway/mode" = { tooltip = false; };

          "sway/language" = {
            format = "{shortDescription}";
            tooltip = false;
          };

          clock = {
            interval = 60;
            format = "{:%a %d/%m %I:%M}";
          };
          backlight = {
            device = "intel_backlight";
            format = "<span color='#fab387'>{icon}</span> {percent}%";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
            disable-scroll = true;
          };
          pulseaudio = {
            format = "<span color='#fab387'>{icon}</span>   {volume}%";
            format-muted = "";
            tooltip = false;
            format-icons.default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
            disable-scroll = true;
          };
          battery = {
            tooltip = false;
            format = "<span color='#fab387'>{icon}</span>   {capacity}%";
            format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
            format-charging = "<span color='#b4befe'></span> {capacity}%";
          };
        };
      };
    };
    wofi.enable = true;
    swaylock = {
      enable = true;
      settings = {
        color = "1e1e2e";
        font = "Ubuntu";
        font-size = 24;
        ring-color = "fab387";
        key-hl-color = "b4befe";
        inside-color = "1e1e2e";
        inside-wrong-color = "f38ba8";
        ring-wrong-color = "f38ba8";
        text-color = "cdd6f4";
        text-clear-color = "cdd6f4";
        text-caps-lock-color = "cdd6f4";
        text-ver-color = "1e1e2e";
        text-wrong-color = "1e1e2e";
        separator-color = "00000000";
        ring-ver-color = "fab387";
        inside-ver-color = "fab387";
        indicator-idle-visible = false;
        indicator-radius = 100;
        show-failed-attempts = true;
      };
    };
  };
}
