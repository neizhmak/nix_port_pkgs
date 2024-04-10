{ pkgs ? import <nixpkgs> { } }:
  
rec {
  thorium = pkgs.callPackage ./thorium { };
  thorium_avx2 = pkgs.callPackage ./thorium_avx3 { };
  thorium_sse3 = pkgs.callPackage ./thorium_sse3 { };
}
