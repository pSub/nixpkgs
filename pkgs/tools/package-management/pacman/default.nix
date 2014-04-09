{ stdenv, fetchurl, automake, autoconf, pkgconfig, gettext, libarchive, curl,
  bzip2, lzma, acl, attr, asciidoc, libxslt}:

let version = "4.1.2"; in


# TODO: Files like makepkg are created empty!

stdenv.mkDerivation {
  name = "pacman-${version}";

  src = fetchurl {
    url = "https://projects.archlinux.org/pacman.git/snapshot/pacman-${version}.tar.gz";
    sha256 = "1g7rid55nnl79shska7gmq4iy5asbyf42mpm51iik78lnn0z74pl";
  };

  buildInputs = [ automake autoconf pkgconfig gettext libarchive curl bzip2 lzma acl attr
                  asciidoc libxslt];

  preConfigure = "./autogen.sh";

  # Somehow the docs do not build.
  configureFlags = "--disable-doc";

  meta = with stdenv.lib; {
    description = "The Arch linux package manager";
    platforms = platforms.linux;
    maintainers = maintainers.pSub;
  };
}
