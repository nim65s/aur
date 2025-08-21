#!/bin/bash -eux
# like makepkg.sh, but not on arch

namcap PKGBUILD

updpkgsums

makepkg

namcap ./*.pkg.tar.zst

makepkg --printsrcinfo > .SRCINFO

sudo pacman -U ./*.pkg.tar.zst

mv ./*.pkg.tar.zst ../repo
