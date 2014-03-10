{ cabal, aeson, haskellSrcExts, haskellSrcMeta, mtl, parseargs
, parsec, regexPosix, safe, syb, text, unorderedContainers, vector
, wlPprintText
}:

cabal.mkDerivation (self: {
  pname = "jmacro";
  version = "0.6.8";
  sha256 = "0z2vlb6lpqw890k1wgcz50hvvy5sis9blcdd4736ggzlnsxamh9r";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    aeson haskellSrcExts haskellSrcMeta mtl parseargs parsec regexPosix
    safe syb text unorderedContainers vector wlPprintText
  ];
  meta = {
    description = "QuasiQuotation library for programmatic generation of Javascript code";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
