#!/bin/sh
NIXPKGS_ALLOW_BROKEN=1 NIXPKGS_ALLOW_UNFREE=1 nix-shell -p "haskell.packages.lts-5_9.ghcWithPackages(p: with p; [$@])"
