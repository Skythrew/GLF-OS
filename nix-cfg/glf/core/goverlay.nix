{ pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [ goverlay ];
  
}
