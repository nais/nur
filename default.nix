{pkgs ? import <nixpkgs> {}, ...}:
{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays
}
// pkgs.lib.filesystem.packagesFromDirectoryRecursive {
  inherit (pkgs) callPackage;
  directory = ./pkgs;
}
