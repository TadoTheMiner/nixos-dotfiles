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
    trashy
    (pkgs.writeShellScriptBin "add-ssh-key" ''${builtins.readFile ./scripts/add-ssh-key}'')
    (pkgs.writeShellScriptBin "nrb" ''${builtins.readFile ./scripts/update}'')
    obsidian
    unstable.impala
  ];
}
