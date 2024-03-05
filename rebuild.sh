#!/usr/bin/env bash

rm ~/.gtkrc-2.0

pushd ~/.nix

set -e
git diff -U0
read -p 'Enter commit message: ' message
git add -A
git commit -m "$message"
set +e

sudo nixos-rebuild switch --flake .#$(cat device)

popd