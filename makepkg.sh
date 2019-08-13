#!/bin/bash

set -ex

makepkg

namcap *.pkg.tar.xz

makepkg --printsrcinfo > .SRCINFO
