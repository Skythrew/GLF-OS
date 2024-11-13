# Documentation
# https://wiki.nixos.org/wiki/Printing
{ pkgs, ... }:

{

  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
	gutenprint
	hplip
	samsung-unified-linux-driver
	splix
	brlaser
	brgenml1lpr
	cnijfilter2
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplip        # HP
      sane-airscan # Apple Airscan
      epkowa       # Epson
    ];
  };
  
}
