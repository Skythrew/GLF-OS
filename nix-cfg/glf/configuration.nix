{ config, ... }:
{
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # NE TOUCHEZ A RIEN
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  boot.kernelParams = if config.boot.kernelModules == [ "kvm-amd" ] then [ "amd_pstate=active" ] else [ ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system = {
    stateVersion = "24.05";
    autoUpgrade = { enable = true; dates = "weekly"; };
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  nix = {

    optimise = {
      automatic = true;
      dates = [ "daily" ];
    };

    settings = {
      auto-optimise-store = true;
    };
  };
}
