#!/bin/sh
NIXPKGS_ALLOW_BROKEN=1 NIXPKGS_ALLOW_UNFREE=1 nix-shell -p "haskellPackages.ghcWithPackages(p: with p; [$@])"
