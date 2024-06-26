{ appimageTools, fetchurl }:
let
  pname = "thorium_avx2";
  version = "122.0.6261";

  src = fetchurl {
    url = "https://github.com/Alex313031/thorium/releases/download/M${version}.132/Thorium_Browser_${version}_AVX2.AppImage";
    sha256 = "sha256-AlmVgp4PmaEHrsJXWHKWC0WVc5X1c1o5BANXqZZKYb8=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
    install -Dm444 ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png

    substituteInPlace $out/share/applications/thorium-browser.desktop \
      --replace "Exec=thorium" "Exec=${pname}-${version}"
  '';
}
