# Documentation
# https://wiki.nixos.org/wiki/Firefox

{

  programs = {
    firefox = {
      enable = true;
      wrapperConfig = {
        pipewireSupport = true;
      };
    };
  };

}
