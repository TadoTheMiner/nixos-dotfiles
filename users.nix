{
  personal_info,
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.nushell;
    groups.plugdev = {};
    users.${personal_info.login} = {
      isNormalUser = true;
      description = personal_info.name;
      extraGroups = ["networkmanager" "wheel" "input" "video" "dialout" "plugdev"];
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --time --cmd sway";
        user = "greeter";
      };

      initial_session = {
        command = "sway";
        user = personal_info.login;
      };
    };
  };

  security = {
    pam.services.swaylock = {};
    sudo = {
      enable = true;
      extraRules = [
        {
          commands = [
            {
              command = "/run/current-system/sw/bin/nix*";
              options = ["NOPASSWD"];
            }
          ];
          groups = ["wheel"];
        }
      ];
    };
  };
}
