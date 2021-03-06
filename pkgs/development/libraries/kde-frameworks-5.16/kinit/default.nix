{ kdeFramework, lib, extra-cmake-modules, kconfig, kcrash
, kdoctools, ki18n, kio, kservice, kwindowsystem, libcap
, libcap_progs
}:

# TODO: setuid wrapper

kdeFramework {
  name = "kinit";
  nativeBuildInputs = [ extra-cmake-modules kdoctools libcap_progs ];
  buildInputs = [ kconfig kcrash kservice libcap ];
  propagatedBuildInputs = [ ki18n kio kwindowsystem ];
  patches = [ ./0001-kinit-libpath.patch ];
  meta = {
    maintainers = [ lib.maintainers.ttuegel ];
  };
}
