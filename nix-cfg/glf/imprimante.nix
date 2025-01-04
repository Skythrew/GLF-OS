{
  config,
  pkgs,
  lib,
  ...
}:
let
  all-users = builtins.attrNames config.users.users;
  normal-users = builtins.filter (user: config.users.users.${user}.isNormalUser == true) all-users;
in
{
  nixpkgs.config.allowUnfree = lib.mkForce true;

  # Configure printer
  services.printing = {
    enable = true;
    startWhenNeeded = true;
    drivers = with pkgs; [
      brgenml1cupswrapper
      brgenml1lpr
      brlaser
      cnijfilter2
      epkowa
      gutenprint
      gutenprintBin
      hplip
      hplipWithPlugin
      samsung-unified-linux-driver
      splix
    ];
  };

  # To install printers manually
  programs.system-config-printer.enable = true;

  # Enable autodiscovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # systemd.services.cups-browsed.enable = false;
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplipWithPlugin
      sane-airscan
      epkowa
      utsushi
    ];
  };
  services.udev.packages = with pkgs; [
    sane-airscan
    utsushi
  ];

  # add all users to group scanner and lp
  users.groups.scanner = {
    members = normal-users;
  };
  users.groups.lp = {
    members = normal-users;
  };
}
