{ cabal, glib, gtk2hsBuildtools, gtk3, gtksourceview, mtl }:

cabal.mkDerivation (self: {
  pname = "gtksourceview3";
  version = "0.12.5.0";
  sha256 = "0anaq87kvn052vslpl83b119yfsl0n8z2j85g4xsbmqrlf4w5y85";
  buildDepends = [ glib gtk3 mtl ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ gtksourceview ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the GtkSourceView library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
