#!/bin/sh

sed -i 's/pkgver=18.1.8/pkgver=19.1.0/g' compiler-rt/PKGBUILD
# sed -i 's/pkgrel=2/pkgrel=1/g' compiler-rt/PKGBUILD
sed -i 's/e054e99a9c9240720616e927cb52363abbc8b4f1ef0286bad3df79ec8fdf892f/SKIP/g' compiler-rt/PKGBUILD
sed -i 's/59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837/SKIP/g' compiler-rt/PKGBUILD
