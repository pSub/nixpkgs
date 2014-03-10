{ cabal, cairo, gio, glib, gtk3, gtk2hsBuildtools, mtl, pango
, time, transformers
}:

cabal.mkDerivation (self: {
  pname = "gtk3";
  version = "0.12.5.6";
  sha256 = "1rv56vvsasq2891z5qmaah4ncln0i5d3jlw4i1myiak7a83m5rkn";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ cairo gio glib mtl pango time transformers ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ glib gtk3 ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Gtk+ graphical user interface library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
