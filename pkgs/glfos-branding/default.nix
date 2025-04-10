{ 
  lib,
  stdenvNoCC, 
  substituteAll, 
  writeScriptBin, 
  fetchFromGitHub, 
  makeWrapper,
  replaceVars,
  fastfetch, 
  coreutils,
  glib,
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
    rev = "749950907cf1de1ab4dc77219bdc5f6a10ba255a";
    sha256 = "sha256-f6XQx4rE/7lCv/L1RehUGSj1fLDGm9IU0gVVlNFZ0RU=";
  };

  buildInputs = [ bash coreutils glib.dev ];

  override = replaceVars ./99_org.gnome.login-screen.gschema.override {
    icon = ''${builtins.placeholder "out"}/share/icons/hicolor/48x48/emblems/glfos-logo.png'';
  };

  installPhase = ''
    # Logo

    for SIZE in 16 32 48 64 128 256; do
      mkdir -p $out/share/icons/hicolor/''${SIZE}x''${SIZE}/emblems
      cp $src/images/os_logo/logo-$SIZE.png $out/share/icons/hicolor/''${SIZE}x''${SIZE}/emblems/glfos-logo.png
    done

    # GDM

    install -D ${override} "$out/share/glib-2.0/schemas/99_org.gnome.login-screen.gschema.override"

    glib-compile-schemas "$out/share/glib-2.0/schemas/"
  '';
  
  meta = {
    description = "GLF-OS branding";
    homepage = "https://github.com/Gaming-Linux-FR/glfos-branding";
    license = lib.licenses.agpl3Plus;
  };

}
