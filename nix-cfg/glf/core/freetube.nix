{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ freetube ];
  
}
