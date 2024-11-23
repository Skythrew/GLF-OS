{ pkgs, config, ... }:
{
  boot = {
    tmp.cleanOnBoot = true;

    kernelPackages = pkgs.linuxPackages_latest;
    #linuxPackages_zen 
    #linuxPackages 
    #linuxPackages_latest 
    #linuxPackages_xanmod_latest

    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    kernelParams = if builtins.elem "kvm-amd" config.boot.kernelModules then [ "amd_pstate=active" ] else [ ];
  };
}
