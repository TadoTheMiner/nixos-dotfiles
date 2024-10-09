{
  pkgs,
  unstable,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    unzip
    pciutils
    jq
    killall
    file
    usbutils
    picocom
    evtest
    tldr
    mdbook
    mpv
    htop
    thefuck
    (pkgs.writeShellScriptBin "nrb" ''${builtins.readFile ./scripts/update}'')
    obsidian
    unstable.impala
  ];
}
