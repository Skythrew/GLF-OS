# Documentation
# https://wiki.nixos.org/wiki/Steam

{ pkgs, ... }:

{

  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
	extraEnv = {
	  MANGOHUD = true;
	  OBS_VKCAPTURE = true;
	};
      };
      extest.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraPackages = with pkgs;[
        gamescope
      ];
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };
  
}
