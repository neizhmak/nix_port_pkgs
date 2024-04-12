{ pkgs, ... }:
let
  version = "6.8.5";
  src = pkgs.fetchurl {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
    hash = "sha256:1h0mzx52q9pvdv7rhnvb8g68i7bnlc9rf8gy9qn4alsxq4g28zm8";
  };
  configfile = import ./cachyos.x86_64-linux.nix;
in pkgs.linuxManualConfig {
    inherit version src configfile;
    allowImportFromDerivation = true;
};
