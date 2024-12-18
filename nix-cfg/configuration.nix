# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NE TOUCHEZ A RIEN
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./glf
  ];

  i18n.defaultLocale = "fr_FR.UTF-8";

  console.keyMap = "fr";
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "";
    excludePackages = [ pkgs.xterm ];
  };

  users.users.test = {
    isNormalUser = true;
    description = "test";
    extraGroups = [ "networkmanager" "wheel" "render" ];
  };

  nvidia_config.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
