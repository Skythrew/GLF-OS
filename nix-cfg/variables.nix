{ lib, ... }: {
  options = { var = lib.mkOption { type = lib.types.attrs; default = { }; }; }; # Touchez pas

  config = {
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Vos configurations
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers.nvidia = "null"; # desktop, laptop
    montage-video = false; # true ou false

    var = {
      # UNIQUEMENT LAPTOP : RENSEIGNER VOS PCI : https://nixos.wiki/wiki/Nvidia
      intelBusId = "";
      amdgpuBusId = "";
      nvidiaBusId = "";

      username = "test";
    };
  };
}
