#!/bin/bash

package=${1:-$(basename $(pwd))}

docker run --rm --name $package -t pkg yaourt -S --noconfirm $package
