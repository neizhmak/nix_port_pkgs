{ pkgs ? import <nixpkgs> {} }:
  
rec {
  thorium = pkgs.callPackage ./thorium {};
}
