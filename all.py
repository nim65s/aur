#!/usr/bin/env python

from concurrent.futures import ProcessPoolExecutor
from multiprocessing import cpu_count
from pathlib import Path
from subprocess import run


def output(pkg):
    with open(f'logs/{pkg}.log', 'w') as f:
        ret = run(['docker', 'run', '--rm', '--name', pkg, '-t', 'pkg', 'yaourt', '-S', '--noconfirm', pkg], stdout=f)
    print(ret.returncode, pkg)


if __name__ == '__main__':
    run(['docker', 'build', '-t', 'pkg', '.'])

    with ProcessPoolExecutor(2 * cpu_count()) as executor:
        executor.map(output, [pkg for pkg in Path('.').iterdir() if pkg.is_dir() and str(pkg) not in ['.git', 'logs']])
