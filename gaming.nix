{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    unciv
    steam-run
    minecraft-server
  ];
  programs = {
    steam.enable = true;
    java.enable = true;
    nix-ld.enable = true; # for random stuff on itch.io
  };
}
