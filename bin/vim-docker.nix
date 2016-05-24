#!/bin/sh
name=vim
(docker images | tail -n+2 | cut -d ' ' -f1 | grep -q "$name" || (cat <<EOF | xargs -0 -I % nix-build -o /tmp/nixbuild/result -E '%' && docker load -i /tmp/nixbuild/result && rm /tmp/nixbuild/result)) && docker run -it $name

with import <nixpkgs> {};
with dockerTools;

buildImage {
  name = "$name";
  config = {
    Cmd = [ "\${vim}/bin/vim" ];
  };
}

EOF
