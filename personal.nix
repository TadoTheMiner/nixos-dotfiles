{...}: {
  # Set your time zone.
  time.timeZone = "Europe/Bratislava";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "de_CH.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_CH.UTF-8";
      LC_IDENTIFICATION = "de_CH.UTF-8";
      LC_MEASUREMENT = "de_CH.UTF-8";
      LC_MONETARY = "de_CH.UTF-8";
      LC_NAME = "de_CH.UTF-8";
      LC_NUMERIC = "de_CH.UTF-8";
      LC_PAPER = "de_CH.UTF-8";
      LC_TELEPHONE = "de_CH.UTF-8";
      LC_TIME = "de_CH.UTF-8";
    };
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tadeas = {
    isNormalUser = true;
    description = "Tadeas Uradnik";
    extraGroups = ["networkmanager" "wheel" "input" "video" "dialout"];
  };
  home-manager.users.tadeas.programs.git = {
    userName = "Tadeas Uradnik";
    userEmail = "taduradnik@gmail.com";
  };
}
