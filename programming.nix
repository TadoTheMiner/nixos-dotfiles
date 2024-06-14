{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rustup
    cargo-nextest
    cargo-make
    gcc
    bacon
    nil
    alejandra
    gh
    gnumake
    ghc
    nasm
    commitizen
    meld
  ];
}
