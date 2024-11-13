# Documentation
# https://wiki.nixos.org/wiki/GNOME

{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect
    gnome.gnome-software
    gnome.adwaita-icon-theme
    gnome.gnome-tweaks
    vlc
  ];

  services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
	settings = {
	  "org/gnome/desktop/wm/preferences" = {
	    button-layout = "appmenu:minimize,maximize,close";
	    # focus-mode = "click";
	    # visual-bell = false;
	  };
	  "org/gnome/desktop/peripherals/touchpad" = {
	    click-method = "areas";
	    tap-to-click = true;
	    two-finger-scrolling-enabled = true;
	  };
	  "org/gnome/desktop/peripherals/keyboard" = { numlock-state = false;  };
	  "org/gnome/shell" = {
	    disable-user-extensions = false;
	    enabled-extensions = [
	      "caffeine@patapon.info"
              "gsconnect@andyholmes.github.io"
              "appindicatorsupport@rgcjonas.gmail.com"
              "dash-to-dock@micxgx.gmail.com"
	    ];
	  };
	};
      }
    ];
  };

  
}
