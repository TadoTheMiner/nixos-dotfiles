{pkgs, ...}:
(pkgs.makeRustPlatform {
  cargo = pkgs.rust-bin.stable.latest.default;
  rustc = pkgs.rust-bin.stable.latest.default;
})
.buildRustPackage rec {
  pname = "bing-wallpaper-server";
  version = "4900c7e";

  src = pkgs.fetchFromGitHub {
    owner = "TadoTheMiner";
    repo = "bing-wallpaper-server";
    rev = "4900c7e5322ed64a81d74bd07b5a55d9dc358eb8";
    hash = "sha256-46GU8olBTFqxNz02KmOmZUmlaDjTXlcyOV0EkU2FjQQ=";
  };
  doCheck = false;
  cargoLock.lockFile = "${src}/Cargo.lock";
  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [openssl];
}
