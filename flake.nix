{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        nuschtosSearch.follows = "";
      };
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    ...
  }: let
    config = ./config;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (
      system: let
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvim config;
      in {
        inherit nvim;
        default = nvim;
      }
    );
  };
}
