{ pkgs, fetchFromGitHub, lib, stdenv, xdg-utils}:
pkgs.telegram-desktop.overrideAttrs ( finalAttrs: previousAttrs:
let

  pname = "ayugram";
  version = "4.16";
  mainProgram = "AyuGramDesktop";

  src = fetchFromGitHub {
    owner = "AyuGram";
    repo = "${mainProgram}";
    rev = "79d6df2c01974007b7943acc6f65fb1258c3a986";
    fetchSubmodules = true;
    hash = "sha256-OSFdSyFXOjLsXjQ0p2BcbUJzZ3lMVLzbxhCV8Rwhu0Y=";
  };

  patches = [];
  postPatch = '''';
  buildInputs = previousAttrs.buildInputs ++ [pkgs.glibmm_2_68];
  postFixup = lib.optionalString stdenv.isLinux ''
    # This is necessary to run Telegram in a pure environment.
    # We also use gappsWrapperArgs from wrapGAppsHook.
    wrapProgram $out/bin/ayugram-desktop \
      "''${gappsWrapperArgs[@]}" \
      "''${qtWrapperArgs[@]}" \
      --suffix PATH : ${lib.makeBinPath [ xdg-utils ]}
  '' + lib.optionalString stdenv.isDarwin ''
    wrapQtApp $out/Applications/ayugram-desktop.app/Contents/MacOS/${mainProgram}
  '';
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
in rec {
    inherit pname version mainProgram src patches postPatch buildInputs postFixup cmakeFlags;

    #previousAttrs.mainProgram = mainProgram;
    #finalAttrs.mainProgram = mainProgram;
})
