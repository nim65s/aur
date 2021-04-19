#!/bin/bash -eux

makepkg --sign

namcap ./*.pkg.tar.zst

makepkg --printsrcinfo > .SRCINFO

sudo pacman -U ./*.pkg.tar.zst

repo-add --verify --sign  ../repo/nim.db.tar.gz ./*.pkg.tar.zst

mv ./*.pkg.tar.zst{,.sig} ../repo

rsync -avP ../repo repo:/srv/chatons/static
