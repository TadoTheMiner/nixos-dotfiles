{ pkgs, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];
  # Set your time zone.
  time.timeZone = "Europe/Bratislava";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sk_SK.UTF-8";
    LC_IDENTIFICATION = "sk_SK.UTF-8";
    LC_MEASUREMENT = "sk_SK.UTF-8";
    LC_MONETARY = "sk_SK.UTF-8";
    LC_NAME = "sk_SK.UTF-8";
    LC_NUMERIC = "sk_SK.UTF-8";
    LC_PAPER = "sk_SK.UTF-8";
    LC_TELEPHONE = "sk_SK.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tadeas = {
    isNormalUser = true;
    description = "Tadeas Uradnik";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  home-manager.programs.git = {
    userName = "Tadeas Uradnik";
    userEmail = "taduradnik@gmail.com";
  };
}
