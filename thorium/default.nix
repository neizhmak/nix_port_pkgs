{ pkgs, stdenv, bash }:
let
  thoriumVersion = "122.0.6261.132";
  thoriumSrc = {
    x86_64-linux = "https://github.com/Alex313031/thorium/releases/download/M${thoriumVersion}/Thorium_Browser_${thoriumVersion}_SSE3.AppImage";
    aarch64-linux = "https://github.com/Alex313031/Thorium-Raspi/releases/download/M${thoriumVersion}/Thorium_Browser_${thoriumVersion}_arm64.AppImage";
  };
  
  makeThorium = system: let
    name = "thorium";
    version = thoriumVersion;
    src = pkgs.fetchurl {
      url = thoriumSrc.${system};
      sha256 = "ijhqMqaCOzPwmGc2GeAONpytJxcoSzyOfVsT0lSBat0=";
    };
    appimageContents = pkgs.appimageTools.extractType2 { inherit name src; };
  in pkgs.appimageTools.wrapType2 {
    inherit name version src;
    extraInstallCommands = ''
      install -Dm444 ${appimageContents}/thorium-browser.desktop $out/share/applications/thorium-browser.desktop
      install -Dm444 ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png
    '';
  };
in
{
  thorium_x86_64-linux = makeThorium "x86_64-linux";
#  thorium_aarch64-linux = makeThorium "aarch64-linux";
}
