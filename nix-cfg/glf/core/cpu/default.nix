{ config, ... }:

{

  boot.kernelParams = if config.boot.kernelModules == [ "kvm-amd" ] then [ "amd_pstate=active" ] else [];
  
}
