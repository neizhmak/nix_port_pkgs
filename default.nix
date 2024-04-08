{ pkgs ? import <nixpkgs> { } }:
  
rec {
  thorium_sse3 = pkgs.callPackage ./thorium { };
}
