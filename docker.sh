#!/bin/bash

package=${1:-$(basename "$(pwd)")}
package=${package%/}

docker run --rm -i --name "$package" -v /var/cache/pacman/pkg/:/var/cache/pacman/pkg/ -v /etc/pacman.d/:/etc/pacman.d/ \
    -t pkg paru -Syu --noconfirm "$package"
