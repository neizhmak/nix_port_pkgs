{ fetchurl, buildLinux, ... } @ args:

  buildLinux (args // rec {
    version = "6.8.5";
    modDirVersion = version;

#    src = fetchurl {
#      url = "https://github.com/jsakkine-intel/linux-sgx/archive/v23.tar.gz";
      # After the first build attempt, look for "hash mismatch" and then 2 lines below at the "got:" line.
      # Use "sha256-....." value here.
#      hash = "";
#    };
    kernelPatches = [];

    extraConfig = import ./cachyos.x86_64-linux.nix;

    extraMeta.branch = "6.8.5";
  } // (args.argsOverride or {}))
