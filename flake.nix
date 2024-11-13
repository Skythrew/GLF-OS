{
  inputs = { nixpkgs.url = "nixpkgs/nixos-24.05"; };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    rec {
      nixosConfigurations = {
        "glf-installer" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;

          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            ./nix-cfg/configuration.nix
            {
              nixpkgs.overlays = [
                (self: super: {
                  calamares-nixos-extensions = super.calamares-nixos-extensions.overrideAttrs (oldAttrs: {
                    postInstall = ''
                      cp ${./patches/main.py} $out/lib/calamares/modules/nixos/main.py
                    '';
                  });
                })
              ];
            }

            ({ config, ... }: {
              isoImage = {
                contents = [
                  {
                    source = ./nix-cfg;
                    target = "/nix-cfg";
                  }
                ];
                includeSystemBuildDependencies = false;
                storeContents = [ config.system.build.toplevel ];
                squashfsCompression = "zstd -Xcompression-level 22";
              };
            })
          ];
        };
      };

      iso = nixosConfigurations."glf-installer".config.system.build.isoImage;
    };
}
