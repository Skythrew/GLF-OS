# Documentation:
# https://wiki.nixos.org/wiki/Lutris

{ pkgs, ... }:

# let
#   lutris = (pkgs.lutris.override{
#     extraLibraries = pkgs: [
#       pkgs.wine-staging
#       pkgs.wine-wayland
#       pkgs.pixman
#       pkgs.libjpeg
#       pkgs.gnome.zenity
#     ];
#     extraPkgs = pkgs: [];
#   });
# in
{

  environment.systemPackages = with pkgs; [ lutris ];
  
}
