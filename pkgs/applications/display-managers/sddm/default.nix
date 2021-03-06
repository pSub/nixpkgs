{ stdenv, fetchpatch, makeQtWrapper, fetchFromGitHub, cmake, pkgconfig, libxcb, libpthreadstubs
, libXdmcp, libXau, qtbase, qtdeclarative, qttools, pam, systemd }:

let
  version = "0.13.0";
in
stdenv.mkDerivation rec {
  name = "sddm-${version}";

  src = fetchFromGitHub {
    owner = "sddm";
    repo = "sddm";
    rev = "v${version}";
    sha256 = "0c3q8lpb123m9k5x3i71mm8lmyzhknw77zxh89yfl8qmn6zd61i1";
  };

  patches = [
    ./0001-ignore-config-mtime.patch
    ./0002-fix-ConfigReader-QStringList-corruption.patch
  ];

  nativeBuildInputs = [ cmake makeQtWrapper pkgconfig qttools ];

  buildInputs = [ libxcb libpthreadstubs libXdmcp libXau qtbase qtdeclarative pam systemd ];

  cmakeFlags = [
    "-DCONFIG_FILE=/etc/sddm.conf"
    # Set UID_MIN and UID_MAX so that the build script won't try
    # to read them from /etc/login.defs (fails in chroot).
    # The values come from NixOS; they may not be appropriate
    # for running SDDM outside NixOS, but that configuration is
    # not supported anyway.
    "-DUID_MIN=1000"
    "-DUID_MAX=29999"
  ];

  preConfigure = ''
    export cmakeFlags="$cmakeFlags -DQT_IMPORTS_DIR=$out/lib/qt5/qml -DCMAKE_INSTALL_SYSCONFDIR=$out/etc -DSYSTEMD_SYSTEM_UNIT_DIR=$out/lib/systemd/system"
  '';

  postInstall = ''
    wrapQtProgram $out/bin/sddm
    wrapQtProgram $out/bin/sddm-greeter
  '';

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "QML based X11 display manager";
    homepage = https://github.com/sddm/sddm;
    platforms = platforms.linux;
    maintainers = with maintainers; [ abbradar ];
  };
}
