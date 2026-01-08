{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ inputs.haskell-flake.flakeModule ];

      perSystem = { self', lib, config, pkgs, ... }: {
        haskellProjects = rec {
          broken = {
            projectRoot = builtins.toString (lib.fileset.toSource {
              root = ./.;
              fileset = lib.fileset.unions [ ./src ./tests ./mwe.cabal ];
            });

            autoWire = [ "packages" "devShells" ];
          };

          working = broken // { basePackages = pkgs.haskell.packages.ghc96; };
        };
      };
    };
}
