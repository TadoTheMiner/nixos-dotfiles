{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = ["eDP-1"];
        margin-bottom = 10;
        modules-left = ["sway/workspaces" "group/system_indicators"];
        "group/system_indicators" = {
          orientation = "inherit";
          modules = ["network" "battery" "backlight" "pulseaudio"];
        };
        modules-center = ["clock"];
        modules-right = ["sway/mode" "sway/language" "custom/waybar-mpris"];
        network = {
          interface = "wlp0s20f3";
          format-wifi = "<span color='#b4befe'>   {signalStrength}%</span> {essid}";
          format-disconnected = "<span color='#f38ba8'>󰖪 </span>No Network";
          tooltip = false;
        };

        "sway/workspaces" = {
          disable-scroll = true;
          sort-by-number = true;
          disable-click = true;
          format = "{icon}";
          format-icons = {
            "1" = "󰈹";
            "2" = "";
            "3" = "";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "0" = "0";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
          };
        };
        "sway/mode".tooltip = false;
        "custom/waybar-mpris" = {
          return-type = "json";
          max-length = 50;
          exec = "${pkgs.waybar-mpris}/bin/waybar-mpris --autofocus --order \"ARTIST:TITLE\"";
          escape = true;
          tooltip = false;
        };
        "sway/language" = {
          format = "{shortDescription}";
          tooltip = false;
        };

        clock = {
          interval = 60;
          format = "{:%a %d/%b %I:%M}";
        };
        backlight = {
          device = "intel_backlight";
          format = "<span color='#b4befe'>{icon}</span> {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          disable-scroll = true;
        };
        pulseaudio = {
          format = "<span color='#b4befe'>{icon}</span> {volume}%";
          format-muted = "<span color='#f38ba8'>󰖁</span> {volume}%";
          tooltip = false;
          format-icons.default = ["󰕿" "󰕿" "󰖀" "󰖀" "󰖀" "󰕾" "󰕾" "󰕾"];
          disable-scroll = true;
        };
        battery = {
          tooltip = false;
          format = "<span color='#b4befe'>{icon}</span>   {capacity}%";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
          format-charging = "<span color='#b4befe'>{icon}   Charging</span> {capacity}%";
        };
      };
    };
  };
}
