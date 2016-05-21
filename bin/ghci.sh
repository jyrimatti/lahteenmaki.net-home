#!/bin/sh
nix-shell -p "haskellPackages.ghcWithPackages(p: with p; [$@])" --run 'ghci'
