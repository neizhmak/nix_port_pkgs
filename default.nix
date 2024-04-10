#{ pkgs ? import <nixpkgs> { } }:
#  
#rec {
#  thorium_sse3 = pkgs.callPackage ./thorium_sse3 { };
#}

{ pkgs ? import <nixpkgs> { }
, lib ? import <nixpkgs/lib>
}:
let
  pname = "thorium_sse3";
  version = "122.0.6261.132";

  src = pkgs.fetchurl {
    url = "https://github.com/Alex313031/thorium/releases/download/M${version}/Thorium_Browser_${version}_SSE3.AppImage";
    sha256 = "sha256-ijhqMqaCOzPwmGc2GeAONpytJxcoSzyOfVsT0lSBat0=";
  };

  appimageContents = pkgs.appimageTools.extract {
    inherit pname version src;
  };
in pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
    install -Dm444 ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
  '';
}
