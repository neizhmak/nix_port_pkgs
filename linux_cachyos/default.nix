{ pkgs }:

pkgs.linuxPackages_latest.overrideAttrs (
  let
    version = "6.8.5";
    modDirVersion = "6.8.5";
  in rec {
    inherit version modDirVersion;
  })
