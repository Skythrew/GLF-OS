{ config, pkgs, ... }:
let
  all-users = builtins.attrNames config.users.users;
  normal-users = builtins.filter (user: config.users.users.${user}.isNormalUser == true) all-users;
in
{
  # Configure printer
  services.printing = {
    enable = true;
    startWhenNeeded = true;
    drivers = with pkgs; [
      brgenml1lpr
      brlaser
      cnijfilter2
      epkowa
      gutenprint
      hplip
      hplipWithPlugin
      samsung-unified-linux-driver
      sane-airscan
      splix
    ];
  };

  # Enable autodiscovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # systemd.services.cups-browsed.enable = false;
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [ sane-airscan epkowa ];
  };

  # add all users to group scanner and lp
  users.groups.scanner = {
    members = normal-users;
  };
  users.groups.lp = {
    members = normal-users;
  };
}
