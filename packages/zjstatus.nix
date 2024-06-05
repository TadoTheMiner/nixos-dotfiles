{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "zjstatus";
  src = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/v0.14.0/zjstatus.wasm";
    sha256 = ''
      sha256-TlPnvSz1ROusMXP0CeQJcugR0RdiKTqwMxpUDiP0SRU=
    '';
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out
    cp $src $out/zjstatus.wasm
  '';
}
