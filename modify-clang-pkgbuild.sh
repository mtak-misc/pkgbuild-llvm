#!/bin/sh

sed -i 's/pkgver=18.1.8/pkgver=19.1.3/g' clang/PKGBUILD
sed -i 's/pkgrel=4/pkgrel=1/g' clang/PKGBUILD
sed -i 's/5724fe0a13087d5579104cedd2f8b3bc10a212fb79a0fcdac98f4880e19f4519/SKIP/g' clang/PKGBUILD
sed -i 's/e58877fcd95ed106824bd1a31276dd17ed0c53adcd60ca75289eac0654f0a7f1/SKIP/g' clang/PKGBUILD
sed -i 's/f68cf90f369bc7d0158ba70d860b0cb34dbc163d6ff0ebc6cfa5e515b9b2e28d/SKIP/g' clang/PKGBUILD
sed -i 's/59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837/SKIP/g' clang/PKGBUILD
sed -i 's/b76b810f3d3dc5d08e83c4236cb6e395aa9bd5e3ea861e8c319b216d093db074/SKIP/g' clang/PKGBUILD
sed -i '/patch -Np2/d' clang/PKGBUILD 
sed -i '/clang-tools-extra|clang/d' clang/PKGBUILD
sed -i 's/-DLLVM_BUILD_TESTS=ON/-DLLVM_BUILD_TESTS=OFF/g' clang/PKGBUILD
sed -i 's/0d4dc477f5a28f9f16639dc094b6d9bc14228d5de771547394799d2d5f8cd1df/SKIP/g' clang/PKGBUILD
