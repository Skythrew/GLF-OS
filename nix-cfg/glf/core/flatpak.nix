# TODO:
# Add condition for enable kde portal if kde is used, or gtk for gnome.
{ pkgs, ... }:

{

  services.flatpak.enable = true;  
  
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  fonts.fontDir.enable = true;
  xdg.portal = {
    enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    # config = {
    #   common.default = ["gtk"];
    # };
  };
}
