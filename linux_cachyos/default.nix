{ pkgs, fetchFromGitHub }:
let
  src = pkgs.fetchFromGitHub {
    owner = "chaotic-cx";
    repo = "nyx";
    ver = "nyxpkgs-unstable";
    fetchSubmodules = true;
    hash = "";
  };
in {
  cachyosPackages = pkgs.callPackage ./pkgs/linux-cachyos/all-packages.nix { };
}


#{ pkgs, ... }:
#let
#  version = "6.8.5";
#  src = pkgs.fetchurl {
#    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
#    hash = "sha256:1h0mzx52q9pvdv7rhnvb8g68i7bnlc9rf8gy9qn4alsxq4g28zm8";
#  };
#  config = ./cachyos.x86_64-linux.nix;
#  configfile = import config;
#in pkgs.linuxManualConfig {
#    inherit version src configfile;
#    allowImportFromDerivation = true;
#}
