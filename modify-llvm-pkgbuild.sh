#!/bin/sh

sed -i 's/pkgver=19.1.7/pkgver=20.1.5/g' llvm/PKGBUILD
sed -i 's/pkgrel=2/pkgrel=1/g' llvm/PKGBUILD
sed -i 's/96f833c6ad99a3e8e1d9aca5f439b8fd2c7efdcf83b664e0af1c0712c5315910/SKIP/g' llvm/PKGBUILD
sed -i 's/11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3/SKIP/g' llvm/PKGBUILD
sed -i 's/b96deca1d3097c7ffd4ff2bb904a50bdd56bec7ed1413ffb0d1d01af87b72c12/SKIP/g' llvm/PKGBUILD
# sed -i '/patch -Np2/d' llvm/PKGBUILD
