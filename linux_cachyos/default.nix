{ fetchurl, buildLinux, ... } @ args:

  buildLinux (args // rec {
    version = "5.4.0-rc3";
    modDirVersion = version;

    src = fetchurl {
      url = "https://github.com/jsakkine-intel/linux-sgx/archive/v23.tar.gz";
      # After the first build attempt, look for "hash mismatch" and then 2 lines below at the "got:" line.
      # Use "sha256-....." value here.
      hash = "";
    };
    kernelPatches = [];

    extraConfig = ''
      INTEL_SGX y
    '';

    extraMeta.branch = "5.4";
  } // (args.argsOverride or {}))
