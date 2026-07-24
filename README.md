# AUR packages & utils

## Prepare Docker Container

```
docker build -t pkg .
```

## Check a pakage

```
cd $package
../makepkg.sh
```

## Check an uploaded package in docker

`./docker.sh $package`

## Check all uploaded packages in docker

`./all.sh`

## Chell all uploaded packages in parallel if you have unlimited RAM & CPUs:

`./all.py`

## Dependencies

`./dependencies.py`

![Dependencies](https://cdn.rawgit.com/nim65s/aur/master/dependencies.gv.svg)

## distrobox

```
distrobox assemble rm && distrobox assemble create && distrobox enter arch
set -e LD_PRELOAD
```

```
curl https://github.com/nim65s.gpg | sudo pacman-key -a -
curl https://github.com/jorisv.gpg | sudo pacman-key -a -
sudo pacman-key --edit-key 9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28 # trust 5 save
sudo pacman-key --edit-key 1462AF00C9CF3C9E7AFC905E63380359F089A579 # trust 5 save
set -x PATH /usr/bin $PATH
```
