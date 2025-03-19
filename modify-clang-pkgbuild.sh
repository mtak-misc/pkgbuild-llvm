#!/bin/sh

sed -i 's/pkgver=19.1.7/pkgver=20.1.1/g' clang/PKGBUILD
sed -i 's/pkgrel=5/pkgrel=1/g' clang/PKGBUILD
sed -i 's/11e5e4ecab5338b9914de3b83a4622cb200de466b7c56ba675afb72fa7d64675/SKIP/g' clang/PKGBUILD
sed -i 's/430b088bf820550090a6cf0eec67183d045273c18b3f1d6c5207e46d93391be7/SKIP/g' clang/PKGBUILD
sed -i 's/96f833c6ad99a3e8e1d9aca5f439b8fd2c7efdcf83b664e0af1c0712c5315910/SKIP/g' clang/PKGBUILD
sed -i 's/11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3/SKIP/g' clang/PKGBUILD
sed -i 's/b96deca1d3097c7ffd4ff2bb904a50bdd56bec7ed1413ffb0d1d01af87b72c12/SKIP/g' clang/PKGBUILD
sed -i '/patch -Np2/d' clang/PKGBUILD 
# sed -i '/clang-tools-extra|clang/d' clang/PKGBUILD
sed -i 's/-DLLVM_BUILD_TESTS=ON/-DLLVM_BUILD_TESTS=OFF/g' clang/PKGBUILD
sed -i 's/94a3d4df2443f9dc9e256e6c0c661ff4a4ca4f34a5ca351f065511b9694faf2a/SKIP/g' clang/PKGBUILD
