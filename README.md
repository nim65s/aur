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

## TODO:

- hpp-model-urdf

## gpg in distrobox

```
distrobox assemble rm && distrobox assemble create && distrobox enter arch
```

```
curl https://github.com/nim65s.gpg  > nim65s.gpg
sudo pacman-key -a nim65s.gpg
sudo pacman-key --edit-key 9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28
# trust
```
