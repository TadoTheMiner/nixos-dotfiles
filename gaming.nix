{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    unciv
    steam-run
    minecraft-server
  ];
  programs.java.enable = true;
  services.flatpak.enable = true; # for steam
  programs.nix-ld.enable = true; # for random stuff on itch.io
}
