# Documentation
# https://wiki.nixos.org/wiki/LibreOffice

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-moderne
  ];
  
}
