{ pkgs, config, ... }:
let
  username = config.var.username;
in
{
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'';
  };

  fonts.fontDir.enable = true;

  users.users.${username}.packages = with pkgs; [

    # APP
    firefox-bin
    thunderbird-latest

    discord
    freetube

    # Bureautique
    libreoffice-fresh
    hunspell
    hunspellDicts.fr-moderne
  ];
} 
