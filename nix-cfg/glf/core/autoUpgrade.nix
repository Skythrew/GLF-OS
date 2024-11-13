{ config, ... }:

{

  system.autoUpgrade = {
    enable = true;
    dates  = "weekly";
  };
  
}
