{...}: {
  imports = [./sway/keybindings.nix];
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      defaultWorkspace = "workspace number 1";
      bars = [{command = "waybar";}];
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
    width = 600;
    font = "Ubuntu 20";
  };
  programs = {
    wofi = {
      enable = true;
      style = "window {
            background-color: #11111b;
        }";
    };
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
