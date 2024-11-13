# Documentation
# https://wiki.nixos.org/wiki/GNOME

{ lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gnomeExtensions.caffeine
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
      gnomeExtensions.gsconnect
      gnome.gnome-software
      gnome.adwaita-icon-theme
      gnome.gnome-tweaks
      vlc
      graphite-gtk-theme
      tela-circle-icon-theme
      adw-gtk3
    ];
  };

  services = {
    udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
    xserver.excludePackages = [ pkgs.xterm ];
  };

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
	settings = {
	  "org/gnome/desktop/wm/preferences" = {
	    button-layout = "appmenu:minimize,maximize,close";
	    theme = "adw-gtk3";
	    # focus-mode = "click";
	    # visual-bell = false;
	  };
	  "org/gnome/desktop/peripherals/touchpad" = {
	    click-method = "areas";
	    tap-to-click = true;
	    two-finger-scrolling-enabled = true;
	  };
	  "org/gnome/desktop/peripherals/keyboard" = {
	    numlock-state = true;
	  };
	  "org/gnome/shell" = {
	    disable-user-extensions = false;
	    enabled-extensions = [
	      "caffeine@patapon.info"
              "gsconnect@andyholmes.github.io"
              "appindicatorsupport@rgcjonas.gmail.com"
              "dash-to-dock@micxgx.gmail.com"
	    ];
	  };
	  "org/gnome/shell/extensions/dash-to-dock" = {
	    click-action="minimize-or-overview";
	    dock-position="BOTTOM";
	    isolate-monitor=false;
	    multi-monitor=true;
	    show-mounts-network=true;
	  };
    		  "org/gnome/mutter" = {
	    check-alive-timeout = lib.gvariant.mkUint32 30000;
	    dynamic-workspaces = true;
	    edge-tiling = true;
	  };
	};
      }
    ];
  };

  
}
