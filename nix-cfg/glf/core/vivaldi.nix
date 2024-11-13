# Documentation
# https://wiki.nixos.org/wiki/Vivaldi

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
  ];
  
}
