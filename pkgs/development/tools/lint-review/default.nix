{ stdenv, fetchFromGitHub, pythonPackages }:

pythonPackages.buildPythonPackage rec {
  name = "lint-review";

  src = fetchFromGitHub {
    owner = "markstory";
    repo = "lint-review";
    rev = "v0.0.6";
    sha256 = "1rkz5brlbh4ldiwdfqzyh00dk3r7rb866x1x7j3vkvsyy1i3pzqq";
  };

  buildInputs = with pythonPackages; [
    gunicorn mock celery flake8 nose pygithub3 flask kombu billiard pytz requests-0140 amqp anyjson
  ];

  preConfigure = ''
    sed -i 's/gunicorn==0.17.2/gunicorn==19.1.0/g' requirements.txt
    sed -i 's/celery==3.0.19/celery==3.1.15/g' requirements.txt
    sed -i 's/flake8==2.2.2/flake8==2.1.0/g' requirements.txt
    sed -i 's/nose==1.2.1/nose==1.3.4/g' requirements.txt
    sed -i 's/Flask==0.9/flask==0.10.1/g' requirements.txt
  '';

  meta = with stdenv.lib; {
    description = "";
  };
}
