# Documentation
# https://wiki.nixos.org/wiki/DaVinci_Resolve

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ davinci-resolve ];
  
}
