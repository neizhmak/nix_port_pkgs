{ pkgs, fetchurl }:
pkgs.telegram-desktop.overrideAttrs {
    pname = "ayugram";
    version = "4.16";

    mainProgram = "AyuGramDesktop";

    src = fetchurl {
      url = "https://github.com/AyuGram/AyuGramDesktop/archive/refs/tags/v4.16.tar.gz";
      hash = "sha256-tPzoZWscPnLuOilBdCWb+ytC+/e5ZlPXX2PuEfmyKiw=";
    };

    patches = [];

    cmakeFlags = [
      "-DCMAKE_BUILD_TYPE=Release"
      "-Ddisable_autoupdate=ON"
      # We're allowed to used the API ID of the Snap package:
      "-DTDESKTOP_API_ID=2040"
      "-DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627"
      # See: https://github.com/NixOS/nixpkgs/pull/130827#issuecomment-885212649
      "-DDESKTOP_APP_USE_PACKAGED_FONTS=OFF"
      "-DDESKTOP_APP_DISABLE_SCUDO=ON"
      "-DDESKTOP_APP_DISABLE_AUTOUPDATE=True"
    ];
}
