# Documentation
# https://wiki.nixos.org/wiki/Thunderbird

# Note, after switch to 24.11, use module instead of environment.systemPackages.
{ pkgs, ... }:

{

  # programs.thunderbird = {
  #   enable = true;
  # };
  environment.systemPackages = with pkgs; [ thunderbird ];
  

}
