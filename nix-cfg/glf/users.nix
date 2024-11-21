{ config, ... }:
let
  username = "test";
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "render" ];
  };
}
