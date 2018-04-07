{ stdenv, fetchurl, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  name = "nagstamon-${version}";
  version = "3.0.2";

  src = fetchurl {
    url = "https://nagstamon.ifw-dresden.de/files/stable/Nagstamon-${version}.tar.gz";
    sha256 = "17bgcjy1bjysipr5y2maws062ayklxbj9xj0hpn8i3xdqjrzpsd6";
  };

  # Test assumes darwin
  doCheck = false;

  propagatedBuildInputs = with pythonPackages; [ configparser pyqt5 psutil requests
     beautifulsoup4 keyring requests_kerberos kerberos ];

  meta = with stdenv.lib; {
    description = "A status monitor for the desktop";
    homepage = https://nagstamon.ifw-dresden.de/;
    license = licenses.gpl2;
    maintainers = with maintainers; [ pSub ];
    inherit version;
  };
}
