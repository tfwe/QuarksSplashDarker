with import <nixpkgs> {}; 

let
  kdePackages = pkgs.libsForQt5;
in
callPackage ./default.nix {
  plasma-framework = kdePackages.plasma-framework;
  inherit (kdePackages) extra-cmake-modules;
}
