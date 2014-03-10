{ cabal, glib, gtk2hsBuildtools, gtk3, webkitgtk, webkitgtk3 }:

cabal.mkDerivation (self: {
  pname = "webkitgtk3-javascriptcore";
  version = "0.12.5.1";
  sha256 = "1a5ghpgphi51jpfny9ffsj87427sp1vk1jzniyvim2g1ln60myk1";
  buildDepends = [ glib gtk3 webkitgtk3 ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ webkitgtk ];
  meta = {
    description = "JavaScriptCore FFI from webkitgtk";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
