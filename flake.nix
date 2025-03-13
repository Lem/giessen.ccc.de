{
  description = "mkdocs-simple-blog Python package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      pythonPackages = pkgs.python312Packages;
    in {
      packages = {
        default = pythonPackages.callPackage ./default.nix {};
        mkdocs-simple-blog = self.packages.${system}.default;
      };

      devShells.default = pkgs.mkShell {
        packages = [
          (pythonPackages.python.withPackages (ps: [
            self.packages.${system}.default # Includes mkdocs-simple-blog and its dependencies
            ps.pip
            ps.virtualenv
          ]))
        ];
      };
    });
}
