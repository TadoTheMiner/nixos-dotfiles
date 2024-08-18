{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    unzip
    networkmanagerapplet
    jq
    killall
    file
    usbutils
    picocom
    evtest
  ];
}
