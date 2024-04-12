{ pkgs ? import <nixpkgs> { } }:
let
  linux_cachyos_pkgs = pkgs.callPackage ./linux_cachyos { };
in rec {
  thorium = pkgs.callPackage ./thorium { };
  thorium_avx2 = pkgs.callPackage ./thorium_avx2 { };
  thorium_sse3 = pkgs.callPackage ./thorium_sse3 { };
  linux_cachyos = pkgs.callPackage ./linux_cachyos { };
#  linux_cachyos = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_cachyos_pkgs);
}
