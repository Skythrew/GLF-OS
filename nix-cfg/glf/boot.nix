{ pkgs, lib, ... }:
{
  boot = {
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest; ##linuxPackages_zen #linuxPackages #linuxPackages_latest #linuxPackages_xanmod_latest

    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      # grub = {
      #   enable = lib.mkForce true;
      #   efiSupport = true;
      #   useOSProber = true;
      #   configurationLimit = 10;
      # };
    };
  };
}
