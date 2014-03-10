{ cabal, cairo, glib, gtk2hsBuildtools, gtk3, mtl, pango
, webkitgtk
}:

cabal.mkDerivation (self: {
  pname = "webkitgtk3";
  version = "0.12.5.3";
  sha256 = "0wyb1n4rx1bql9wcqry5976k854f8ffp5r85lskb7azk04kx71fb";
  buildDepends = [ cairo glib gtk3 mtl pango ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ webkitgtk ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Webkit library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
