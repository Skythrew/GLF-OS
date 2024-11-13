# Documentation
# https://wiki.nixos.org/wiki/OpenRGB

# TODO: add (automatic) condition for set motherboard/cpu family.

{

  services.hardware.openrgb = {
    enable = true;
    # motherboard = "amd|intel"; 
  };
  
}
