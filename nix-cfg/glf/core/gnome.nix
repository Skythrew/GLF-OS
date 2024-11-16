# Documentation
# https://wiki.nixos.org/wiki/GNOME

{ lib, pkgs, ... }:

{

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
  
  environment = {
    systemPackages = with pkgs; [
      gnomeExtensions.caffeine
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
      gnomeExtensions.gsconnect
      gnome-software
      adwaita-icon-theme
      gnome-tweaks
      vlc
      graphite-gtk-theme
      tela-circle-icon-theme
      adw-gtk3
    ];
  };

  services = {
    udev.packages = [ pkgs.gnome-settings-daemon ];
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
	  };
	  "org/gnome/desktop/interface" = {
	    cursor-theme="Adwaita";
	    gtk-theme="adw-gtk3";
	    icon-theme="Tela-circle";
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
	    favorite-apps = [
	      "firefox.desktop"
	      "steam.desktop"
	      "net.lutris.Lutris.desktop"
	      "com.heroicgameslauncher.hgl.desktop"
	      "discord.desktop"
	      "thunderbird.desktop"
	      "org.gnome.Nautilus.desktop"
	      "org.gnome.Software.desktop"
	      "org.gnome.Calendar.desktop"
	    ];
	  };
	  "org/gnome/shell/extensions/dash-to-dock" = {
	    click-action        = "minimize-or-overview";
	    dock-position       = "BOTTOM";
	    isolate-monitor     = false;
	    multi-monitor       = true;
	    show-mounts-network = true;
	    always-center-icons = true;
	    dash-max-icon-size  = lib.gvariant.mkInt32 32;
	    extend-height       = true;
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
