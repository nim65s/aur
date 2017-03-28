#!/bin/bash

makepkg || exit

namcap *.pkg.tar.xz || exit

makepkg --printsrcinfo > .SRCINFO

rm -rf pkg src *.tar.*
