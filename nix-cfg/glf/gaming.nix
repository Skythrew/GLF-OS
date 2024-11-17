{ pkgs, config, ... }:
let
  username = config.var.username;
in
{
  services.hardware.openrgb = {
    enable = true;
    # motherboard = "amd|intel"; 
  };

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    goverlay
    mangohud
  ];

  hardware.steam-hardware.enable = true;

  services.udev.extraRules = ''
    # USB
    ATTRS{name}=="Sony Interactive Entertainment Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    # Bluetooth
    ATTRS{name}=="Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override { extraEnv = { MANGOHUD = true; OBS_VKCAPTURE = true; }; };
      extest.enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };
}
