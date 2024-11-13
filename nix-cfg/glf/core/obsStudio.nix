# Documentation
# https://wiki.nixos.org/wiki/OBS_Studio

{ pkgs, ... }:

{

  # Wait 24.11
  # programs.obs-studio = {
  #   enable = true;
  #   plugins = with pkgs.obs-studio-plugins; [
  #     wlrobs
  #     obs-backgroundremoval
  #     obs-pipewire-audio-capture
  #   ];
  # };

  environment.systemPackages = with pkgs; [ obs-studio ];
  
}
