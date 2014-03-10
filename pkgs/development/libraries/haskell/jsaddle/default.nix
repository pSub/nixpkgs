{ cabal, glib, gtk3, hslogger, jmacro, lens, text, transformers
, webkitgtk3, webkitgtk3Javascriptcore
}:

cabal.mkDerivation (self: {
  pname = "jsaddle";
  version = "0.1.1.3";
  sha256 = "1rkhlkvj3kgm4x6cc2irw8rd3ypz80ia8x28ikmjgllqbzzmw2qm";
  buildDepends = [
    jmacro lens text transformers webkitgtk3 webkitgtk3Javascriptcore
  ];
  testDepends = [
    glib gtk3 hslogger jmacro lens text transformers webkitgtk3
    webkitgtk3Javascriptcore
  ];
  meta = {
    description = "High level interface for webkit-javascriptcore";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
