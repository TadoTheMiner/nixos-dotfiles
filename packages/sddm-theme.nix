{
  fetchFromGitHub,
  qtbase,
  qtsvg,
  qtgraphicaleffects,
  qtquickcontrols2,
  wrapQtAppsHook,
  stdenvNoCC,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "sddm-theme";
  version = "bc892a9";
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/sddm-theme
  '';
  src = fetchFromGitHub {
    owner = "tadotheminer";
    repo = "sddm-candy-catppuccin-peach";
    rev = "bc892a9423607298143e8c52eca95f44670206ed";
    sha256 = "sha256-fzz/YUantBvUbfIJS0eIe+xTnVyDxPk16DRNzxHtV3k";
  };
  propagatedUserEnvPkgs = [qtbase qtsvg qtgraphicaleffects qtquickcontrols2];
  nativeBuildInputs = [wrapQtAppsHook];
}
