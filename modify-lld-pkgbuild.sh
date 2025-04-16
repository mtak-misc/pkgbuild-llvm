#!/bin/sh

sed -i 's/pkgver=19.1.7/pkgver=20.1.3/g' lld/PKGBUILD
sed -i 's/630bf0f31b210e89fd7869bdfd6c376d010fc3b72ee42f08058435035c432e42/SKIP/g' lld/PKGBUILD
sed -i 's/96f833c6ad99a3e8e1d9aca5f439b8fd2c7efdcf83b664e0af1c0712c5315910/SKIP/g' lld/PKGBUILD
sed -i 's/10e650f436bc416674f01b5e01177405886f4d0f0b2568c6808044eacad52ea0/SKIP/g' lld/PKGBUILD
sed -i 's/11c5a28f90053b0c43d0dec3d0ad579347fc277199c005206b963c19aae514e3/SKIP/g' lld/PKGBUILD
# sed -i '/patch -Np2/d' lld/PKGBUILD
