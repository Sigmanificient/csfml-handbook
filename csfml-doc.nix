{
  stdenv,
  python3Packages,
  doxygen,
  fetchFromGitHub,
  sphinx-sitemap,
  gitMinimal,
}:
let
  csfml-v2 = fetchFromGitHub {
    owner = "SFML";
    repo = "CSFML";
    tag = "2.6.1";
    hash = "sha256-ECt0ySDpYWF0zuDBSnQzDwUm4Xj4z1+XSC55D6yivac=";
  };

  csfml-v3 = fetchFromGitHub {
    owner = "SFML";
    repo = "CSFML";
    tag = "3.0.0-rc.3";
    hash = "sha256-Vfck2Wh7J5GXjBmtOZmVjwgirOQRKyiBlv1NfKJlAnQ=";
  };


in stdenv.mkDerivation {
  name = "CSFML-handbook";
  src = ./.;

  buildInputs = [ doxygen ];

  nativeBuildInputs = (with python3Packages; [
    linkify-it-py
    myst-parser
    sphinx
    furo
    sphinx-copybutton
    sphinx-design
    sphinx-notfound-page
    breathe
  ]) ++ [
    sphinx-sitemap
    gitMinimal
  ];

  preBuild = ''
    cp -r ${csfml-v2} csfml
    cp -r ${csfml-v3} csfml-3

    substituteInPlace api/Makefile \
      --replace-fail 'TAG := $(shell cd ' "TAG := ${csfml-v2.tag} #"
    substituteInPlace api-v3/Makefile \
      --replace-fail 'TAG := $(shell cd ' "TAG := ${csfml-v3.tag} #"
  '';

  installPhase = ''
    mkdir -p $out/
    cp -R .build/html/* $out/
  '';
}
