# Module utile pour le développement (débogage, etc.)
# N'oubliez pas d'ajouter vos dépendances à l'entête :
# { lib, config, pkgs, ... }:

{ lib, config, ... }:

{

  options.glf.debug.enable = lib.mkOption {
    description = "Enable GLF debug";
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.glf.debug.enable {

    # Add here your debug configuration

  };

}
