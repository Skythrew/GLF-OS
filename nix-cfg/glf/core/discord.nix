# Documentation
# https://wiki.nixos.org/wiki/Discord

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ discord ];
  
}
