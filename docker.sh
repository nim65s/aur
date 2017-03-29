#!/bin/bash

package=${1:-$(basename $(pwd))}

docker run --rm --name $package -t yaourt yaourt -S --noconfirm $package
