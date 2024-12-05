# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NE TOUCHEZ A RIEN
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./glf
  ];

  users.users.test = {
    isNormalUser = true;
    description = "test";
    extraGroups = [ "networkmanager" "wheel" "render" ];
  };

  nvidia_config.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
