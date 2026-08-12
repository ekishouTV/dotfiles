#!/bin/bash

curl -sSfL https://artifacts.nixos.org/nix-installer/tag/2.35.1/nix-installer.sh \
| sh -s -- install --no-confirm --enable-flakes && \
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
