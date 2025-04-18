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
      extraGroups = ["wheel" "input" "video" "dialout" "plugdev"];
    };
  };

  nix.settings.trusted-users = [personal_info.login];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.nushell}/bin/nu";
        user = personal_info.login;
      };

      initial_session = {
        command = "dbus-run-session sway";
        user = personal_info.login;
      };
    };
  };
}
