{ pkgs, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "bing-wallpaper-server";
  version = "35d4ed1";

  src = fetchFromGitHub {
    owner = "TadoTheMiner";
    repo = pname;
    rev = "35d4ed15217708b966b06256b15219da4bc41fa2";
    hash = "sha256-eB9BtKKMZnsrqySQAYVW9pOAGGf95M1jvySsIWeuois=";
  };
  doCheck = false;
  cargoHash = "sha256-9haW0Ko6PF/TGuXYhWH07bE/J3Fd/dR3ck/Im8Mo5dg=";
  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ openssl ];
}
