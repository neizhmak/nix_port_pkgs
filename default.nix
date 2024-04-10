#{ pkgs ? import <nixpkgs> { } }:
#  
#rec {
#  thorium_sse3 = pkgs.callPackage ./thorium_sse3 { };
#}

{ appimageTools, fetchurl }:
let
  pname = "thorium_sse3";
  version = "122.0.6261.132";

  src = fetchurl {
    url = "https://github.com/Alex313031/thorium/releases/download/M${version}/Thorium_Browser_${version}_SSE3.AppImage";
    sha256 = "sha256-ijhqMqaCOzPwmGc2GeAONpytJxcoSzyOfVsT0lSBat0=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
    install -Dm444 ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
  '';
}
