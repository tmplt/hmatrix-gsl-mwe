{
  inputs = {
    nixpkgs.url =
      "github:nixos/nixpkgs?rev=d9b69c3ec2a2e2e971c534065bdd53374bd68b97";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ inputs.haskell-flake.flakeModule ];

      perSystem = { self', lib, config, pkgs, ... }: {
        haskellProjects.default = {
          projectRoot = builtins.toString (lib.fileset.toSource {
            root = ./.;
            fileset = lib.fileset.unions [ ./src ./tests ./mwe.cabal ];
          });
        };
        packages.default = self'.packages.mwe;
      };
    };
}
