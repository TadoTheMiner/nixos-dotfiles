{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    unciv
  ];
  programs.java.enable = true;
  services.flatpak.enable = true;
}
