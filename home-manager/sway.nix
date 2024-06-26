{lib, ...}: {
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
  services = {
    mako = {
      enable = true;
      borderColor = lib.mkForce "#fab387";
      borderSize = 2;
      borderRadius = 20;
      width = 600;
      font = "Ubuntu 20";
    };
    swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 150;
          command = "swaymsg \"output * dpms off\"";
          resumeCommand = "swaymsg \"output * dpms on\"";
        }
      ];
    };
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
        font = "Ubuntu";
        font-size = 24;
        ring-color = lib.mkForce "fab387";
        ring-ver-color = lib.mkForce "fab387";
        indicator-idle-visible = false;
        indicator-radius = 100;
        show-failed-attempts = true;
      };
    };
  };
}
