{ pkgs }:

pkgs.linuxPackagesFor (pkgs.linux_6_8.overrideAttrs (
  let
#    version = "6.8.5";
#    modDirVersion = "6.8.5";
  in rec {
#    inherit version modDirVersion;
  }))
