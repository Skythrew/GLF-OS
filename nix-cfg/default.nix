{
  imports = [
    ./hardware-configuration.nix

    ./glf/nh.nix
    ./glf/boot.nix
    ./glf/time.nix
    ./glf/users.nix
    ./glf/gnome.nix
    ./glf/nvidia.nix
    ./glf/fstrim.nix
    ./glf/gaming.nix
    ./glf/montage.nix
    ./glf/xserver.nix
    ./glf/pipewire.nix
    ./glf/configuration.nix
  ];
}
