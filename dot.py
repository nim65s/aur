#!/usr/bin/env python

from pathlib import Path

import requests

from graphviz import Digraph


# def deps(pkg):
    # ret = set()
    # with (pkg / 'PKGBUILD').open() as f:
        # for line in f:
            # if 'depends' in line:
                # line = line.strip().split('=')[1][1:-1]
                # print(f'l: «{line}»')
                # for dep in line.split():
                    # print(f'  d: «{dep}»')
                    # ret.add(dep[1:-1].split(':')[0])
    # return ret


def deps(pkg):
    json = requests.get('https://aur.archlinux.org/rpc/', {'v': 5, 'type': 'info', 'arg': pkg}).json()
    ret = []
    for field in ['OptDepends', 'MakeDepends', 'Depends']:
        if field in json['results'][0]:
            ret += [dep.split(':')[0] for dep in json['results'][0][field]]
    return ret


dirs = [pkg for pkg in Path('.').iterdir() if pkg.is_dir() and str(pkg) not in ['.git', 'logs']]
pkgs = {pkg: deps(pkg) for pkg in dirs}
deps = set.union(set(str(pkg) for pkg in pkgs), *[set(pkgs[pkg]) for pkg in pkgs])

dot = Digraph(format='svg')
for dep in deps:
    dot.node(str(dep))
for pkg in pkgs:
    for dep in pkgs[pkg]:
        dot.edge(str(pkg), str(dep))
dot.render()
