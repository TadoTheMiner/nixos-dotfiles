{...}: {
  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [{command = "waybar";}];
      keybindings = {
        "Mod4+Print" = "screenshot.sh";
        "Print" = "screenshot.sh region";
        "Shift+Print" = "screenshot.sh fullscreen";
        "Mod4+p" = "exec cliphist list | wofi -S dmenu | cliphist decode | wl-copy";
        "Mod4+Return" = "exec kitty";
        "Mod4+Shift+q" = "kill";
        "Mod4+d" = "exec wofi --show drun | xargs swaymsg exec --";

        "Mod4+Left" = "focus left";
        "Mod4+Right" = "focus right";
        "Mod4+Up" = "focus up";
        "Mod4+Down" = "focus down";

        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move right";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move down";

        "Mod4+f" = "fullscreen";
        "Mod4+Shift+c" = "reload";
        "Mod4+Shift+e" = "exit";
        "Mod4+Shift+s" = ''exec sh -c "systemctl suspend; swaylock"'';
        "Mod4+Shift+i" = ''exec sh -c "systemctl hibernate; swaylock"'';
        "Mod4+Shift+r" = "exec systemctl reboot";

        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";
        "Mod4+0" = "workspace 󰈹";
        # Move focused container to workspace
        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";

        "Mod4+Shift+space" = "floating toggle";
        "Mod4+space" = "focus mode_toggle";

        "Mod4+Shift+minus" = "move scratchpad";
        "Mod4+minus" = "scratchpad show";

        "Mod4+r" = "mode resize";

        "XF86MonBrightnessUp" = "exec brightnessctl s 10%+";
        "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";
        "Mod4+BackSpace" = ''input "type:keyboard" xkb_switch_layout next'';
        "XF86AudioRaiseVolume" = "exec pamixer -i 10";
        "XF86AudioLowerVolume" = "exec pamixer -d 10";
        "XF86AudioMute" = "exet pamixer -t";
      };
      output."*".bg = "#1e1e2e solid_color";
      input."type:keyboard".xkb_layout = "us,sk";
      startup = [
        # Launch Firefox on start
        {command = ''sh -c "firefox | swaymsg"'';}
        {command = "wl-paste --watch cliphist store";}
      ];
      floating = {
        titlebar = false;
        border = 5;
      };
      window = {
        titlebar = false;
        border = 5;
      };
      gaps.smartBorders = "on";
      colors = {
        background = "1e1e2e";
        focused = {
          background = "1e1e2e";
          border = "fab387";
          childBorder = "fab387";
          indicator = "fab387";
          text = "cdd6f4";
        };
        focusedInactive = {
          background = "1e1e2e";
          border = "b4befe";
          childBorder = "b4befe";
          indicator = "b4befe";
          text = "cdd6f4";
        };
        unfocused = {
          background = "1e1e2e";
          border = "00000000";
          childBorder = "1e1e2e";
          indicator = "1e1e2e";
          text = "cdd6f4";
        };

        urgent = {
          background = "1e1e2e";
          border = "f38ba8";
          childBorder = "1e1e2e";
          indicator = "1e1e2e";
          text = "cdd6f4";
        };
      };
    };
  };
  services.mako = {
    enable = true;
    backgroundColor = "#1e1e2e";
    borderColor = "#fab387";
    borderSize = 2;
    borderRadius = 20;
    textColor = "#cdd6f4";
    progressColor = "#fab387";
    font = "Ubuntu 20";
  };
  programs = {
    waybar = {
      enable = true;
      style = builtins.readFile ./waybar.css;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          output = ["eDP-1"];
          margin-bottom = 10;
          modules-left = ["sway/workspaces" "sway/language"];
          modules-center = ["clock"];
          modules-right = ["network" "battery" "backlight" "pulseaudio"];
          network = {
            interface = "wlp0s20f3";
            format-wifi = "<span color='#fab387'>   {signalStrength}%</span> {essid}";
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

          "sway/mode" = {tooltip = false;};

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
            format-icons = ["" "" "" "" "" "" "" "" ""];
            disable-scroll = true;
          };
          pulseaudio = {
            format = "<span color='#fab387'>{icon}</span>   {volume}%";
            format-muted = "";
            tooltip = false;
            format-icons.default = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
            disable-scroll = true;
          };
          battery = {
            tooltip = false;
            format = "<span color='#fab387'>{icon}</span>   {capacity}%";
            format-icons = ["" "" "" "" "" "" "" "" "" ""];
            format-charging = "<span color='#fab387'>{icon}   Charging</span> {capacity}%";
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
        text-clear-color = "1e1e2e";
        text-caps-lock-color = "cdd6f4";
        text-ver-color = "1e1e2e";
        text-wrong-color = "1e1e2e";
        separator-color = "00000000";
        ring-ver-color = "fab387";
        inside-ver-color = "fab387";
        ring-clear-color = "a6e3a1";
        inside-clear-color = "a6e3a1";
        bs-hl-color = "f38ba8";
        indicator-idle-visible = false;
        indicator-radius = 100;
        show-failed-attempts = true;
      };
    };
  };
}
