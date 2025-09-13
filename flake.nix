{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    applySystems = nixpkgs.lib.genAttrs ["x86_64-linux"];
    forAllSystems = f: applySystems (system: f nixpkgs.legacyPackages.${system});
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShell {
        inputsFrom = [ self.packages.${pkgs.system}.csfml-handbook ];
      };
    });

    packages = forAllSystems (pkgs: {
      default = self.packages.${pkgs.system}.csfml-handbook;

      csfml-handbook = pkgs.callPackage ./csfml-doc.nix {
        inherit (self.packages.${pkgs.system}) sphinx-sitemap;
      };

      sphinx-sitemap = pkgs.python3Packages.callPackage ./sphinx-sitemap.nix
        { inherit (self.packages.${pkgs.system}) sphinx-last-updated-by-git; };

      sphinx-last-updated-by-git = pkgs.python3Packages.callPackage
        ./sphinx-last-updated-by-git.nix { };
    });
  };
}
