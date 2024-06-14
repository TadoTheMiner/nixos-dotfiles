{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    unzip
    networkmanagerapplet
    jq
    killall
    file
    evtest
  ];
}
