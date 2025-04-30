#!/bin/sh

sed -i 's/pkgver=19.1.7/pkgver=20.1.4/g' compiler-rt/PKGBUILD
# sed -i 's/pkgrel=2/pkgrel=1/g' compiler-rt/PKGBUILD
sed -i 's/c12b6e764202c615c1a3af9a13d477846878757ae0e29e5f8979215a6958fffc/SKIP/g' compiler-rt/PKGBUILD
sed -i 's/11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3/SKIP/g' compiler-rt/PKGBUILD
