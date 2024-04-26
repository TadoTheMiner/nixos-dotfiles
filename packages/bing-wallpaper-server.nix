{ pkgs, ... }:
(pkgs.makeRustPlatform {
  cargo = pkgs.rust-bin.stable.latest.default;
  rustc = pkgs.rust-bin.stable.latest.default;
}).buildRustPackage {
  pname = "bing-wallpaper-server";
  version = "4900c7e";

  src = pkgs.fetchFromGitHub {
    owner = "TadoTheMiner";
    repo = "bing-wallpaper-server";
    rev = "4900c7e5322ed64a81d74bd07b5a55d9dc358eb8";
    hash = "sha256-46GU8olBTFqxNz02KmOmZUmlaDjTXlcyOV0EkU2FjQQ=";
  };
  doCheck = false;
  cargoHash = "sha256-DmtgN5L0lBFvdqZKHxcO0JkeNkBesE3Jo+Xb9+pDRmE=";
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ openssl ];
}
