{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nuget-packageslock2nix = {
      url = "github:mdarocha/nuget-packageslock2nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, nuget-packageslock2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.with-deps-nix = pkgs.callPackage ./package.nix {
          nugetDeps = ./deps.nix;
        };

        packages.with-nuget-packageslock2nix = pkgs.callPackage ./package.nix {
          nugetDeps = nuget-packageslock2nix.lib {
            inherit system;
            lockfiles = [ ./packages.lock.json ];
          };
        };
      });
}
