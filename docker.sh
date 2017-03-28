#!/bin/bash

# docker pull alekzonder/archlinux-yaourt

docker run --rm -v /tmp/packages:/var/cache/pacman/pkg -t alekzonder/archlinux-yaourt \
    sudo -u yaourt sh -c "yaourt -S --noconfirm eigen32; yaourt -S --noconfirm $(basename $(pwd))"
    #sudo -u yaourt sh -c "yes|yaourt -S --noconfirm $(basename $(pwd))"
