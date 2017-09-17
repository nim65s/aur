# AUR packages & utils

## Prepare Docker Container

`docker build -t pkg .`

## Check a pakage

```bash
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
