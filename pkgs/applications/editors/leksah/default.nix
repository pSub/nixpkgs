{ cabal, binary, binaryShared, blazeHtml, Cabal, conduit, deepseq
, executablePath, filepath, ghcjsCodemirror, ghcjsDom, gio, glib
, haskell-gtk3, gtk3, gtksourceview3, hamlet, haskellSrcExts, hlint, hslogger
, jsaddle, leksahServer, lens, ltk, monadLoops, mtl, network
, parsec, prettyShow, QuickCheck, regexBase, regexTdfa, strict
, text, time, transformers, utf8String, vado, vcsgui, vcswrapper
, webkitgtk3, webkitgtk3Javascriptcore, makeWrapper
}:

cabal.mkDerivation (self: {
  pname = "leksah";
  version = "0.13.3.0";
  sha256 = "0lqlbjm8944arlma74nsi28vzxagxag91dc2yh8zbya4nmlq6xcc";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    binary binaryShared blazeHtml Cabal conduit deepseq executablePath
    filepath ghcjsCodemirror ghcjsDom gio glib haskell-gtk3 gtksourceview3
    hamlet haskellSrcExts hlint hslogger jsaddle leksahServer lens ltk
    mtl network parsec prettyShow QuickCheck regexBase regexTdfa strict
    text time transformers utf8String vado vcsgui vcswrapper webkitgtk3
    webkitgtk3Javascriptcore
  ];
  buildTools = [ makeWrapper ];
  testDepends = [
    Cabal glib haskell-gtk3 gtksourceview3 hslogger leksahServer ltk monadLoops
    QuickCheck transformers webkitgtk3
  ];
  noHaddock = true;
  doCheck = false;
  postInstall = ''
    wrapProgram "$out/bin/leksah" \
      --prefix GSETTINGS_SCHEMA_DIR : "${gtk3}/share/glib-2.0/schemas/"
  '';
  meta = {
    homepage = "http://www.leksah.org";
    description = "Haskell IDE written in Haskell";
    license = "GPL";
    platforms = self.stdenv.lib.platforms.linux;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
