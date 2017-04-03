#!/bin/bash

package=${1:-$(basename $(pwd))}

docker run --rm -i --name $package -v /var/cache/pacman/pkg/:/var/cache/pacman/pkg/ -v /etc/pacman.d/:/etc/pacman.d/ \
    -t pkg yaourt -S --noconfirm $package
