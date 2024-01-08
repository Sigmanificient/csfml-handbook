{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      rec {
        formatter = pkgs.nixpkgs-fmt;

        devShell = pkgs.mkShell {
          inputsFrom = [ packages.csfml-handbook ];
        };

        packages = rec {
          # Credits to nix.dev for the base derivation
          default = csfml-handbook;
          csfml-handbook = pkgs.stdenv.mkDerivation {
            name = "CSFML-handbook";
            src = ./.;

            buildInputs = [ pkgs.doxygen ];
            nativeBuildInputs = with pkgs.python310.pkgs; [
              linkify-it-py
              myst-parser
              sphinx
              furo
              sphinx-copybutton
              sphinx-design
              sphinx-notfound-page
              sphinx-sitemap
              breathe
            ];

            buildPhase = ''
              mkdir -p csfml/include
              cp -r ${pkgs.csfml}/include csfml
              make
            '';

            installPhase = ''
              mkdir -p $out/
              cp -R .build/html/* $out/
            '';
          };
        };
      });
}
