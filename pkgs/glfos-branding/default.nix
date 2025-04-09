{ 
  lib,
  stdenvNoCC, 
  substituteAll, 
  writeScriptBin, 
  fetchFromGitHub, 
  makeWrapper, 
  fastfetch, 
  coreutils, 
  gawk,
  bash, 
  glfIcon ? "GLF"  # ### Use GLF icon or GLFos icon (to change icon) (How to create an overlay with this expression ?)
}:

stdenvNoCC.mkDerivation rec {
  pname = "glfos-branding";
  version = "git-${builtins.substring 0 7 src.rev}"; ### To update version number

  src = fetchFromGitHub {
    owner = "Gaming-Linux-FR";
    repo = pname;
    rev = "59d8f62bc0abca7824266c8ad02b86f2e04101d4";
    sha256 = "sha256-COSP7jDZLDy1603T76LzKclkgSX5MnJWayANlXZyaIM=";
  };

  buildInputs = [ bash coreutils ];

  installPhase = ''
    # Logo

    for SIZE in 16 32 48 64 128 256; do
      mkdir -p $out/share/icons/hicolor/''${SIZE}x''${SIZE}/emblems
      cp $src/images/os_logo/logo-$SIZE.png $out/share/icons/hicolor/''${SIZE}x''${SIZE}/emblems/glfos-logo.png
    done
  '';
  
  meta = {
    description = "GLF-OS branding";
    homepage = "https://github.com/Gaming-Linux-FR/glfos-branding";
    license = lib.licenses.agpl3Plus;
  };

}
