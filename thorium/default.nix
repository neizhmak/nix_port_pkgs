{ appimageTools, fetchurl }:
let
  pname = "thorium";
  version = "122.0.6261.132";

  src = fetchurl {
    url = "https://github.com/Alex313031/thorium/releases/download/M${version}/Thorium_Browser_${version}_x64.AppImage";
    sha256 = "sha256-P10CI4C6V9vkkCLHhj4FVw6qyrchCpmnO7yDgajJnF8=";
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
